Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A521206C6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 14:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6424C6E46C;
	Mon, 16 Dec 2019 13:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F86F6E46C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:15:34 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 05:15:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; d="scan'208";a="209298033"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 16 Dec 2019 05:15:30 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 16 Dec 2019 15:15:29 +0200
Date: Mon, 16 Dec 2019 15:15:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: display/ingenic: Add compatible
 string for JZ4770
Message-ID: <20191216131529.GN1208@intel.com>
References: <20191210144142.33143-1-paul@crapouillou.net>
 <20191214105418.GA5687@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191214105418.GA5687@ravnborg.org>
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
Cc: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 14, 2019 at 11:54:18AM +0100, Sam Ravnborg wrote:
> Hi Paul.
> =

> On Tue, Dec 10, 2019 at 03:41:37PM +0100, Paul Cercueil wrote:
> > Add a compatible string for the LCD controller found in the JZ4770 SoC.
> > =

> > v2: No change
> > =

> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > Acked-by: Rob Herring <robh@kernel.org>
> =

> Whole series looks good.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Paul, looks like you forgot to git commit --amend after adding the tags.
Now the commit messages have and extra "# *** extracted tags ***" in them.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
