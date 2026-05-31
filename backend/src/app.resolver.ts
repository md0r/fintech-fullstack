import { Resolver, Query } from '@nestjs/graphql';

@Resolver()
export class AppResolver {
  @Query(() => String, { description: 'A baseline status check for the Fintech API' })
  getSystemStatus(): string {
    return 'Fintech Backend API is operational.';
  }
}