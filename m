Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E49151CAD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 15:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8D46E84C;
	Tue,  4 Feb 2020 14:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B65F6E835;
 Tue,  4 Feb 2020 14:57:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Feb 2020 06:57:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,402,1574150400"; d="scan'208";a="235186978"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 04 Feb 2020 06:57:28 -0800
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 4 Feb 2020 06:57:28 -0800
Received: from bgsmsx106.gar.corp.intel.com (10.223.43.196) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 4 Feb 2020 06:57:27 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.36]) by
 BGSMSX106.gar.corp.intel.com ([169.254.1.198]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 20:27:24 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH 6/8] drm/edid: Add a FIXME about DispID CEA
 data block revision
Thread-Topic: [Intel-gfx] [PATCH 6/8] drm/edid: Add a FIXME about DispID CEA
 data block revision
Thread-Index: AQHV0vFRvK3Rx8nvZ0q0EHz2sUQxxagJ9d2AgADHEACAAG/agA==
Date: Tue, 4 Feb 2020 14:57:24 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823AAAA0@BGSMSX104.gar.corp.intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200124200231.10517-6-ville.syrjala@linux.intel.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F823AA020@BGSMSX104.gar.corp.intel.com>
 <20200204133212.GI13686@intel.com>
In-Reply-To: <20200204133212.GI13686@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTFlYmUwNmUtNWNiZC00OTk0LThkNjAtOWMzOGM5MmEwMWJjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibG5iMUlpZzVtbW1HMW9zWWFheHR1dlAzczdVS0JhZThBeHp5ZnFJTm1saFRiS200bFlVNVpSeWtcL2VyckJpcm4ifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Andres
 Rodriguez <andresx7@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Tuesday, February 4, 2020 7:02 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; And=
res
> Rodriguez <andresx7@gmail.com>
> Subject: Re: [Intel-gfx] [PATCH 6/8] drm/edid: Add a FIXME about DispID C=
EA data
> block revision
> =

> On Mon, Feb 03, 2020 at 08:15:51PM +0000, Shankar, Uma wrote:
> >
> >
> > > -----Original Message-----
> > > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf
> > > Of Ville Syrjala
> > > Sent: Saturday, January 25, 2020 1:32 AM
> > > To: dri-devel@lists.freedesktop.org
> > > Cc: intel-gfx@lists.freedesktop.org; Andres Rodriguez
> > > <andresx7@gmail.com>
> > > Subject: [Intel-gfx] [PATCH 6/8] drm/edid: Add a FIXME about DispID
> > > CEA data block revision
> > >
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > >
> > > I don't understand what the DispID CEA data block revision means.
> > > The spec doesn't say. I guess some DispID must have a value of >=3D 3
> > > in there or else we generally wouldn't even parse the CEA data
> > > blocks. Or does all this code actually not do anything?
> >
> > This signifies the CTA extension revision (byte 1 of the block). As
> > per the spec, seems like Version 1 is legacy and 2 is deprecated. So ve=
rsion >=3D3 is
> checked here.
> > Refer section 7.3 of CTA-861-G
> =

> The confusion is about the revision field in the DispID CTA block, not in=
 the CTA
> extension block.

Oh ok, got the ambiguity here. Not sure if we actually get >3 here as value=
 for the block revision,
totally unclear from spec, default being 0. Good to have this comment till =
we get some clarity on
its significance. Thanks for the clarification.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> >
> > > Cc: Andres Rodriguez <andresx7@gmail.com>
> > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_edid.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > > index
> > > 0369a54e3d32..fd9b724067a7 100644
> > > --- a/drivers/gpu/drm/drm_edid.c
> > > +++ b/drivers/gpu/drm/drm_edid.c
> > > @@ -3977,6 +3977,13 @@ cea_db_tag(const u8 *db)  static int
> > > cea_revision(const
> > > u8 *cea)  {
> > > +	/*
> > > +	 * FIXME is this correct for the DispID variant?
> > > +	 * The DispID spec doesn't really specify whether
> > > +	 * this is the revision of the CEA extension or
> > > +	 * the DispID CEA data block. And the only value
> > > +	 * given as an example is 0.
> > > +	 */
> > >  	return cea[1];
> > >  }
> > >
> > > --
> > > 2.24.1
> > >
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> =

> --
> Ville Syrj=E4l=E4
> Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
