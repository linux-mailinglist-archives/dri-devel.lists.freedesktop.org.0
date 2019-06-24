Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441FC52493
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F316E037;
	Tue, 25 Jun 2019 07:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80059.outbound.protection.outlook.com [40.107.8.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F7489718
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:48:15 +0000 (UTC)
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com (20.178.123.141) by
 VI1PR04MB5360.eurprd04.prod.outlook.com (20.178.120.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 07:48:13 +0000
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::3d8f:3ac3:c34e:eb7b]) by VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::3d8f:3ac3:c34e:eb7b%5]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 07:48:13 +0000
From: Robert Chiras <robert.chiras@nxp.com>
To: "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [EXT] Re: [PATCH v3 1/2] dt-bindings: display: panel: Add support
 for Raydium RM67191 panel
Thread-Topic: [EXT] Re: [PATCH v3 1/2] dt-bindings: display: panel: Add
 support for Raydium RM67191 panel
Thread-Index: AQHVJ2xX1b/vfXFflkiTFJeIvUdOWqamJJQAgAAEZ4CAABkHAIAEMX0A
Date: Mon, 24 Jun 2019 07:48:13 +0000
Message-ID: <1561362492.9328.84.camel@nxp.com>
References: <1561037428-13855-1-git-send-email-robert.chiras@nxp.com>
 <1561037428-13855-2-git-send-email-robert.chiras@nxp.com>
 <CAOMZO5DunK3+ovBd0c0X4NTf-zkW1Tjz6KgXFMaRQKMk2SBMiw@mail.gmail.com>
 <1561126587.9328.76.camel@nxp.com>
 <CAOMZO5D+7msAxc99KFi=OWCNeBSxKXtJ8O=J7U+YE6v=xz3cAg@mail.gmail.com>
In-Reply-To: <CAOMZO5D+7msAxc99KFi=OWCNeBSxKXtJ8O=J7U+YE6v=xz3cAg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53208722-4afa-4ec2-c9df-08d6f8784f84
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB5360; 
x-ms-traffictypediagnostic: VI1PR04MB5360:
x-microsoft-antispam-prvs: <VI1PR04MB5360C757F6E8CC2C121DD60FE3E00@VI1PR04MB5360.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(136003)(39860400002)(376002)(366004)(199004)(189003)(50226002)(229853002)(11346002)(66946007)(446003)(73956011)(256004)(14444005)(486006)(4744005)(44832011)(54906003)(2351001)(2501003)(66556008)(66476007)(186003)(5660300002)(476003)(2616005)(66446008)(6916009)(76116006)(7416002)(86362001)(71190400001)(26005)(1411001)(71200400001)(1730700003)(8676002)(5640700003)(6246003)(99286004)(81156014)(81166006)(6486002)(8936002)(1361003)(66066001)(76176011)(36756003)(478600001)(6506007)(7736002)(305945005)(6116002)(53546011)(64756008)(3846002)(6512007)(68736007)(53936002)(6436002)(316002)(4326008)(25786009)(14454004)(103116003)(2906002)(102836004)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5360;
 H:VI1PR04MB5967.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CM0Z+Lh4f165j09fp9AOnBGaicx+8H/7yqcaVHXccFneDGXvmo8HjReeIKLkyAmm6cqs1Eg71nOhqWqo5FsjtI7D5fbkYuLgIMja9UoIARsupFmIqvNb8fztpqMxzZHRNb9jNLrOXBDsJiOf6rqhbZI+i40/OWlzwBzZ3mwp9ylt+qmKEaQf5C1VVqzQaSARtVbbjr/OyMwl0uXT4OBgQqRV54H9Na95gKSZi3rLeftGlsknJA2zjJWQHSpFHHKiiVgIUAk8cmkwMggD/8RDGQwfhBGZUP+ViuPgM6E8zCaicTcGj4eslVsZhncWzZ/25vmpOuCZKyuXPahe0XX/X1GzZl3hD8gMdM/QbLY6L2wr0hQMzmXSdShr4IkmbVCnMfeaozTVw6pCuyeH3SX17XlJCPCNLP0EI6QJi/zbR4Q=
Content-ID: <D4765E46EF0F1E4FA320CFFAEC33B1B9@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53208722-4afa-4ec2-c9df-08d6f8784f84
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 07:48:13.1531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: robert.chiras@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5360
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKjceA3iJU/kWyTfA5RB6ZPVa/cW5eYmov8Gi1u34s0=;
 b=LFeY5Z+jh+f1eBzOD/nRtk9tKYRn2QfOmcmtJpmqu2DypR4oGrrwChPdXaD6+wgmRXRx5TAqWJmmEWVFE0MH0cwaFt/1SkOisvccu3xTFakXaYIOWqIaq92dxsOHDB/hMbM47QzGq74He68ZcExwaCvlV1ikUFHCxc74cV1axXI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=robert.chiras@nxp.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVmksIDIwMTktMDYtMjEgYXQgMTI6NDYgLTAzMDAsIEZhYmlvIEVzdGV2YW0gd3JvdGU6DQo+
IENhdXRpb246IEVYVCBFbWFpbA0KPiANCj4gSGkgUm9iZXJ0LA0KPiANCj4gT24gRnJpLCBKdW4g
MjEsIDIwMTkgYXQgMTE6MTYgQU0gUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAuY29t
DQo+ID4gd3JvdGU6DQo+IA0KPiA+IA0KPiA+IEZyb20gd2hhdCBJJ3ZlIHNlZW4gaW4gdGhlIHNj
aGVtYXRpY3MsIHRoZSBwb3dlciBsaW5lcyBvbiB0aGUgRFNJDQo+ID4gcG9ydA0KPiA+IG9uIGFs
bCB0aGUgaS5NWDggY29yZXMgYXJlIGNvbWluZyBmcm9tIGEgUE1JQyBwcm92aWRpbmcgcG93ZXIg
Zm9yDQo+ID4gYWxsDQo+ID4gdGhlIHBlcmlwaGVyYWxzLiBTaW5jZSBJIGRpZG4ndCBmaW5kIGEg
d2F5IHRvIGN1dCB0aGUgcG93ZXIgb24gYQ0KPiA+IHNpbmdsZQ0KPiA+IHBlcmlwaGVyYWwgKGxp
a2UgRFNJLCBmb3IgZXhhbXBsZSkgaXQgZG9lc24ndCBtYWtlIHNlbnNlIGZvciBwb3dlci0NCj4g
PiBzdXBwbHkgcHJvcGVydHkuIEZvciBub3csIGF0IGxlYXN0Lg0KPiBUaGlzIHBhbmVsIGRyaXZl
ciBpcyBub3Qgc3VwcG9zZWQgdG8gb25seSB3b3JrIHdpdGggaS5NWDggTlhQDQo+IHJlZmVyZW5j
ZSBib2FyZHMuDQo+IA0KPiBUaGUgZHQtYmluZGluZ3Mgc2hvdWxkIGJlIGFzIGFjY3VyYXRlIGFz
IHBvc3NpYmxlIGZyb20gZGF5IG9uZSwgc28NCj4gZGVzY3JpYmluZyB0aGUgcG93ZXItc3VwcGx5
IGlzIGltcG9ydGFudC4NCj4gDQo+IFBsZWFzZSBsb29rIGF0IHRoZSBwYW5lbCBkYXRhc2hlZXQg
YW5kIGRlc2NyaWJlIHRoZSByZXF1aXJlZCBwb3dlcg0KPiBzdXBwbGllcyBhY2NvcmRpbmdseS4N
Ck9LLCBJIHdpbGwgYWRkIHRoZSBwb3dlciByZWd1bGF0b3JzIGFzIHRoZXkgYXJlIGRlc2NyaWJl
ZCBpbiBwYW5lbA0KZGF0YXNoZWV0LiBJIGp1c3Qgd29uJ3QgYmUgYWJsZSB0byB0ZXN0IHRoZW0u
DQo+IA0KPiBUaGFua3MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
