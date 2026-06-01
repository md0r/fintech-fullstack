import { Resolver, Query } from '@nestjs/graphql';

@Resolver()
export class HealthResolver {
  @Query(() => String, {
    description: 'Health check endpoint to verify API is operational',
  })
  getSystemStatus(): string {
    return 'Backend API is operational.';
  }
}
