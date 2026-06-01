import { Field, InputType } from '@nestjs/graphql';
import { IsNotEmpty, IsOptional, IsString } from 'class-validator';

@InputType()
export class UpdateUserInput {
  @Field({ nullable: true })
  @IsString()
  @IsNotEmpty({ message: 'First name cannot be empty' })
  @IsOptional()
  firstName?: string;

  @Field({ nullable: true })
  @IsString()
  @IsNotEmpty({ message: 'Last name cannot be empty' })
  @IsOptional()
  lastName?: string;
}
