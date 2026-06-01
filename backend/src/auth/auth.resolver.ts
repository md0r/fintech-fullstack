import { UseGuards } from '@nestjs/common';
import { Args, Mutation, Resolver } from '@nestjs/graphql';
import type { User as UserModel } from '@prisma/client';
import { AuthService } from './auth.service';
import { CurrentUser } from './decorators';
import { LoginInput, RefreshTokenInput, SignupInput } from './dto';
import { JwtAuthGuard } from './guards';
import { AuthResponse } from './types';

@Resolver()
export class AuthResolver {
  constructor(private authService: AuthService) {}

  @Mutation(() => AuthResponse, {
    description: 'Register a new user account',
  })
  async signup(@Args('signupInput') signupInput: SignupInput) {
    return this.authService.signup(signupInput);
  }

  @Mutation(() => AuthResponse, {
    description: 'Login with email and password',
  })
  async login(@Args('loginInput') loginInput: LoginInput) {
    return this.authService.login(loginInput);
  }

  @Mutation(() => AuthResponse, {
    description: 'Refresh access token using refresh token',
  })
  async refreshToken(
    @Args('refreshTokenInput') refreshTokenInput: RefreshTokenInput,
  ) {
    return this.authService.refreshToken(refreshTokenInput.refreshToken);
  }

  @UseGuards(JwtAuthGuard)
  @Mutation(() => Boolean, {
    description: 'Logout user and invalidate refresh token',
  })
  async logout(@CurrentUser() user: UserModel) {
    return this.authService.logout(user.id);
  }
}
