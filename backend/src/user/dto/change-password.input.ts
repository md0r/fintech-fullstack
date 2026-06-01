import { Field, InputType } from '@nestjs/graphql';
import { IsNotEmpty, IsString, Matches, MinLength } from 'class-validator';

@InputType()
export class ChangePasswordInput {
  @Field()
  @IsString()
  @IsNotEmpty({ message: 'Old password is required' })
  oldPassword: string;

  @Field()
  @IsString()
  @MinLength(8, { message: 'New password must be at least 8 characters long' })
  @Matches(/^(?=.*[A-Z])(?=.*\d)/, {
    message: 'New password must contain at least one uppercase letter and one digit',
  })
  @IsNotEmpty({ message: 'New password is required' })
  newPassword: string;
}
