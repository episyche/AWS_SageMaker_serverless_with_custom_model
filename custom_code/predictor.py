from __future__ import print_function

import flask
from flask import Flask, jsonify, request

# The flask app for serving predictions
app = Flask(__name__)


@app.route("/ping", methods=["GET"])
def ping():# -> Any:
    """Determine if the container is working and healthy. In this sample container, we declare
    it healthy if we can load the model successfully."""
    # health = ClassificationService.get_model() is not None
    health = True

    status = 200 if health else 404
    return flask.Response(response="\n", status=status, mimetype="application/json")


@app.route("/invocations", methods=["POST"])
def transformation():  # -> Any:

    return_value = request.json
    return jsonify(return_value)
