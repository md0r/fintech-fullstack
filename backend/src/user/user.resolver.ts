import { UseGuards } from '@nestjs/common';
import { Args, Mutation, Query, Resolver } from '@nestjs/graphql';
import type { User as UserModel } from '@prisma/client';
import { CurrentUser } from '../auth/decorators';
import { JwtAuthGuard } from '../auth/guards';
import { User } from '../auth/types';
import { ChangePasswordInput, UpdateUserInput } from './dto';
import { UserService } from './user.service';

@Resolver(() => User)
export class UserResolver {
  constructor(private userService: UserService) {}

  @UseGuards(JwtAuthGuard)
  @Query(() => User, {
    description: 'Get current authenticated user profile',
  })
  async getMe(@CurrentUser() user: UserModel) {
    return this.userService.getMe(user.id);
  }

  @UseGuards(JwtAuthGuard)
  @Mutation(() => User, {
    description: 'Update user profile information',
  })
  async updateUser(
    @CurrentUser() user: UserModel,
    @Args('updateUserInput') updateUserInput: UpdateUserInput,
  ) {
    return this.userService.updateUser(user.id, updateUserInput);
  }

  @UseGuards(JwtAuthGuard)
  @Mutation(() => Boolean, {
    description: 'Change user password',
  })
  async changePassword(
    @CurrentUser() user: UserModel,
    @Args('changePasswordInput') changePasswordInput: ChangePasswordInput,
  ) {
    return this.userService.changePassword(user.id, changePasswordInput);
  }

  @UseGuards(JwtAuthGuard)
  @Mutation(() => Boolean, {
    description: 'Soft delete user account (marks as inactive)',
  })
  async deleteAccount(@CurrentUser() user: UserModel) {
    return this.userService.deleteAccount(user.id);
  }
}
