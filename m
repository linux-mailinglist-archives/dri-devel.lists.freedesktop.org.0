Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D760827B07C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 17:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA6589E7C;
	Mon, 28 Sep 2020 15:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16C989D81;
 Mon, 28 Sep 2020 15:03:03 +0000 (UTC)
IronPort-SDR: 5VFXK3PDJ6cLdXKbzo3EqacHtRTHjDjoTjipaU5CngGA1H40V1J6hUnYSCXenWJblW6pfOGdiN
 lfSeIBRVDIyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="180166484"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="180166484"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 08:03:02 -0700
IronPort-SDR: aLJzel/XmAtvgyLorNuAiOgfAeS8V5xtqe2C+9LuYOGKswvM4oGlwQnzhaCVMU8jKZUvTImmbI
 FjDW0zVYfp9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="311817505"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 28 Sep 2020 08:02:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Sep 2020 18:02:57 +0300
Date: Mon, 28 Sep 2020 18:02:57 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: James Ausmus <james.ausmus@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/edp/jsl: Update vswing table
 for HBR and HBR2
Message-ID: <20200928150257.GW6112@intel.com>
References: <20200928080931.246347-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20200928080931.246347-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <87a6xaow40.fsf@intel.com>
 <20200928141543.GG5197@jausmus-gentoo-dev6>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928141543.GG5197@jausmus-gentoo-dev6>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: hariom.pandey@intel.com, airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 lucas.demarchi@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, jose.souza@intel.com,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 28, 2020 at 07:15:43AM -0700, James Ausmus wrote:
> On Mon, Sep 28, 2020 at 04:43:11PM +0300, Jani Nikula wrote:
> > On Mon, 28 Sep 2020, Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay=
@intel.com> wrote:
> > > JSL has update in vswing table for eDP
> > =

> > I've thought the TLA for Jasper Lake is JSP, not JSL. At least we have
> > PCH_JSP for Jasper Lake PCH.
> =

> JSP =3D=3D Point (the PCH), JSL =3D=3D Lake

.PT was "<something> Point", ..P stands just for "<something> PCH" IIRC.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
