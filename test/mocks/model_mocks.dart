import 'package:visite_la/src/model/request_model.dart' as r;

r.RequestModel requestModelMock = r.RequestModel(
  results: [
    r.Results(
        addressComponents: [
          r.AddressComponents(
              longName: "31", shortName: "31", types: ["street_number"]),
          r.AddressComponents(
              longName: "Rua Expedicionário Brasileiro",
              shortName: "R. Expedicionário Brasileiro",
              types: ["route"]),
          r.AddressComponents(
              longName: "Centro",
              shortName: "Centro",
              types: ["political", "sublocality", "sublocality_level_1"]),
          r.AddressComponents(
              longName: "Arapiraca",
              shortName: "Arapiraca",
              types: ["administrative_area_level_2", "political"]),
          r.AddressComponents(
              longName: "Alagoas",
              shortName: "AL",
              types: ["administrative_area_level_1", "political"]),
          r.AddressComponents(
              longName: "Brasil",
              shortName: "BR",
              types: ["country", "political"]),
          r.AddressComponents(
              longName: "57300-590",
              shortName: "57300-590",
              types: ["postal_code"]),
        ],
        formattedAddress:
            "R. Expedicionário Brasileiro, 31 - Centro, Arapiraca - AL, 57300-590, Brasil",
        geometry: r.Geometry(
          location: r.Location(
            lat: -9.748532899999999,
            lng: -36.6640064,
          ),
          locationType: "ROOFTOP",
          viewport: r.Viewport(
            northeast: r.Location(
              lat: -9.747159919708499,
              lng: -36.6626280197085,
            ),
            southwest: r.Location(
              lat: -9.749857880291504,
              lng: -36.6653259802915,
            ),
          ),
        ),
        placeId: "ChIJ3ZuuUpfVBQcRfxbgb2rC0WQ",
        plusCode: r.PlusCode(
          compoundCode: "782P+H9 Arapiraca - AL, Brasil",
          globalCode: "6925782P+H9",
        ),
        types: ["street_address"]),
  ],
  status: "OK",
);
