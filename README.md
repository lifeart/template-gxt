# GXT + TS + Vite

This template should help get you started developing with GXT and TypeScript in Vite.

[Demo](https://lifeart.github.io/template-gxt/)

## Recommended IDE Setup

[VS Code](https://code.visualstudio.com/) + [Syntax](https://marketplace.visualstudio.com/items?itemName=lifeart.vscode-glimmer-syntax) + [Glint](https://marketplace.visualstudio.com/items?itemName=typed-ember.glint-vscode).

## Template content


- Vite
- TypeScript
- GXT
- qUnit
- Tailwind


## Building Your App

1. **Create a new component:**
   - Create a new file in the `src/components` directory, for example, `src/components/MyComponent.gts`.
   - Add your component code, using GlimmerNext's syntax and features.

2. **Import and use your component:**
   - Import your component into `src/App.gts`.
   - Render your component within the `<template>` of `src/App.gts`.

3. **Add styling:**
   - Use Tailwind CSS classes in your component templates.
   - Add custom CSS to `src/style.css`.

4. **Write tests:**
   - Create new test files in the `src/tests/integration` directory.
   - Use QUnit-DOM assertions to test your component's functionality.

## Example: A Simple Counter

Here's an example of a simple counter component:

**`src/components/Counter.gts`**

```typescript
import { Component, tracked } from '@lifeart/gxt';

export class Counter extends Component {
  @tracked count = 0;

  increment = () => {
    this.count++;
  };

  <template>
    <div>
      <p>Count: {{this.count}}</p>
      <button {{on 'click' this.increment}}>Increment</button>
    </div>
  </template>
}
```

**`src/App.gts`**

```gts
import { Component } from '@lifeart/gxt';
import Counter from '@/components/Counter.gts';

export default class App extends Component {
  <template>
    <Counter />
  </template>
}
```

**`src/tests/integration/counter-test.gts`**

```gts
import { module, test } from 'qunit';
import { render, click } from '@lifeart/gxt/test-utils';

module('Integration | Component | Counter', function () {
  test('it renders', async function (assert) {
    await render(hbs`<Counter />`);
    assert.dom('p').hasText('Count: 0');
  });

  test('it increments the count', async function (assert) {
    await render(hbs`<Counter />`);
    assert.dom('p').hasText('Count: 0');

    await click('button');
    assert.dom('p').hasText('Count: 1');
  });
});
```

## Running Tests

To run your tests, open following url:

```bash
/tests.html
```

## Building for Production

To build your application for production, use the following command:

```bash
pnpm build
```

This will create an optimized build of your application in the `dist` directory.