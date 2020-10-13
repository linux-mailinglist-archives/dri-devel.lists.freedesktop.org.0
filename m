Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D235428D6F5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 01:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14756E994;
	Tue, 13 Oct 2020 23:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F62A6E994
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 23:30:51 +0000 (UTC)
IronPort-SDR: QYECrz9nLHQvJZepZwRHUBuchEV9zHyH3ugRNgk1fAq4hoKNOfUxhpkmQeKd2vdbllF2lfq8x/
 9UIMysnMeLQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="166115764"
X-IronPort-AV: E=Sophos;i="5.77,372,1596524400"; d="scan'208";a="166115764"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 16:30:50 -0700
IronPort-SDR: 235LoJrnDi8tb/2MVYVbqUho211EXcnyCLEh3YDOE9lJvmMGsuGANCF6MixwASEPbaW4LE6+xF
 xwG/25jfLLIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,372,1596524400"; d="scan'208";a="345438754"
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139])
 by fmsmga004.fm.intel.com with ESMTP; 13 Oct 2020 16:30:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 IRSMSX606.ger.corp.intel.com (163.33.146.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 14 Oct 2020 00:30:47 +0100
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.1713.004;
 Tue, 13 Oct 2020 16:30:46 -0700
From: "Paauwe, Bob J" <bob.j.paauwe@intel.com>
To: Rob Herring <robh@kernel.org>, "Chrisanthus, Anitha"
 <anitha.chrisanthus@intel.com>
Subject: RE: [PATCH v9 1/5] dt-bindings: display: Add support for Intel
 KeemBay Display
Thread-Topic: [PATCH v9 1/5] dt-bindings: display: Add support for Intel
 KeemBay Display
Thread-Index: AQHWndgeA8gVyqifRECc4bPveICdhKmPcYSAgAW2nACAAQB6AIAAA2rw
Date: Tue, 13 Oct 2020 23:30:46 +0000
Message-ID: <e765f70b66494d6eace3d2de2ee5628d@intel.com>
References: <1602205443-9036-1-git-send-email-anitha.chrisanthus@intel.com>
 <1602205443-9036-2-git-send-email-anitha.chrisanthus@intel.com>
 <dc12f5ea-60bc-8a09-9b93-a4472183adc4@baylibre.com>
 <BY5PR11MB41827BBE3556CD7972E6C4328C040@BY5PR11MB4182.namprd11.prod.outlook.com>
 <20201013154236.GA3562909@bogus>
In-Reply-To: <20201013154236.GA3562909@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Rob
> Herring
> Sent: Tuesday, October 13, 2020 8:43 AM
> To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> Cc: devicetree@vger.kernel.org; Neil Armstrong <narmstrong@baylibre.com>;
> Dea, Edmund J <edmund.j.dea@intel.com>; dri-devel@lists.freedesktop.org;
> Vetter, Daniel <daniel.vetter@intel.com>; sam@ravnborg.org
> Subject: Re: [PATCH v9 1/5] dt-bindings: display: Add support for Intel KeemBay
> Display
> 
> On Tue, Oct 13, 2020 at 12:24:38AM +0000, Chrisanthus, Anitha wrote:
> > Hi Neil,
> >
> >  Thanks for your review, please see my reply inline.
> >
> > > -----Original Message-----
> > > From: Neil Armstrong <narmstrong@baylibre.com>
> > > Sent: Friday, October 9, 2020 2:10 AM
> > > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>; dri-
> > > devel@lists.freedesktop.org; devicetree@vger.kernel.org; Vetter, Daniel
> > > <daniel.vetter@intel.com>
> > > Cc: Dea, Edmund J <edmund.j.dea@intel.com>; sam@ravnborg.org
> > > Subject: Re: [PATCH v9 1/5] dt-bindings: display: Add support for Intel
> > > KeemBay Display
> > >
> > > Hi,
> > >
> > > On 09/10/2020 03:03, Anitha Chrisanthus wrote:
> > > > This patch adds bindings for Intel KeemBay Display
> > > >
> > > > v2: review changes from Rob Herring
> > > >
> > > > Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > > > ---
> > > >  .../bindings/display/intel,keembay-display.yaml    | 99
> > > ++++++++++++++++++++++
> > > >  1 file changed, 99 insertions(+)
> > > >  create mode 100644
> > > Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/intel,keembay-
> > > display.yaml b/Documentation/devicetree/bindings/display/intel,keembay-
> > > display.yaml
> > > > new file mode 100644
> > > > index 0000000..a38493d
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/intel,keembay-
> > > display.yaml
> > > > @@ -0,0 +1,99 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/intel,keembay-
> > > display.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Devicetree bindings for Intel Keem Bay display controller
> > > > +
> > > > +maintainers:
> > > > +  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > > > +  - Edmond J Dea <edmund.j.dea@intel.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: intel,kmb_display
> > > > +
> > > > +  reg:
> > > > +    items:
> > > > +      - description: Lcd registers range
> > > > +      - description: Mipi registers range
> > >
> > > Looking at the registers, the MIPI transceiver seems to be a separate IP,
> > > same for D-PHY which should have a proper PHY driver instead of beeing
> > > handled
> > > here.
> > >
> > The LCD, MIPI DSI, DPHY and MSSCAM as a group, are considered the
> > display subsystem for Keem Bay. As such, there are several
> > interdependencies that make splitting them up next to impossible and
> 
> Please detail what those inter-dependencies are. It's doubtful that you
> have anything we have not had to deal with in other SoCs.
> 
> > currently we do not have the resources available for that effort.
> 
> That is certainly not justification for accepting this.
> 
> Rob

Hi Rob,  the wording was probably a bit exaggerated and you're right in that
there it's not unique from a hardware perspective.

The problem we have (and I know, it's our problem, not yours) is that our 
program required us to develop this internally first and then try to upstream it. 
So now that we've put a large effort into developing and testing the driver, it's 
very difficult for us to justify the resources to re-design it to better match the
design of other SOC display drivers.

We did review other SOC display drivers before creating this and thought that we
were following the best practices for the design.

I fully agree that lack of resources is not justification for not fixing something
broken. But on the flip side,  neither is changing the design because it could
be "better" justification for not accepting it.

If there is something wrong with the driver and it will cause problems in the
future, then please, let us know.  That would provide the data needed to 
justify additional effort.

Bob

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
