import { WebPlugin } from '@capacitor/core';
import { DetectEnvironmentPlugin } from './definitions';

export class DetectEnvironmentWeb extends WebPlugin implements DetectEnvironmentPlugin {
  constructor() {
    super({
      name: 'DetectEnvironment',
      platforms: ['web'],
    });
  }

  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}

const DetectEnvironment = new DetectEnvironmentWeb();

export { DetectEnvironment };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(DetectEnvironment);
