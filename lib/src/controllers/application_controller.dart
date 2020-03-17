typedef void StatefullDataUpdater();
typedef void StateUpdater(StatefullDataUpdater callback);

class ApplicationController {
  StateUpdater setState;

  ApplicationController({
    this.setState,
  });
}
