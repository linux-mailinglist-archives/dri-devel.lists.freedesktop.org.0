Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3212AC4A1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 20:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0438940F;
	Mon,  9 Nov 2020 19:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65508940F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 19:08:15 +0000 (UTC)
IronPort-SDR: Qsx4T95CFpbNUWNMZjgtGzKK2cxC33C40Kwk0q9T+A3Gw+VD4Ogy0bkk+dPmctjuanMy5LF+gl
 LvRGUbmOlrqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="231485167"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="231485167"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 11:08:15 -0800
IronPort-SDR: 0r43pxb7JvqR6+RwF6HbyemFwySilAl/4aVAM920R/2Hqeo4gEHRQL0E7JSePlOMhX5Oi2o2DD
 muw/pClS/GKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="365174740"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 09 Nov 2020 11:08:09 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Nov 2020 21:08:08 +0200
Date: Mon, 9 Nov 2020 21:08:08 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
Message-ID: <20201109190808.GN6112@intel.com>
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
 <20201103222013.hypmzlq7uuqufe76@box>
 <71dc852e52bfeafc8c03a6fa3cd5f3cdd4eb6609.camel@redhat.com>
 <20201109115209.rwhoe4zttaxirx6c@box>
 <ea2450953182320516f8e8bf857625c58a18f584.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea2450953182320516f8e8bf857625c58a18f584.camel@redhat.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 09, 2020 at 12:50:48PM -0500, Lyude Paul wrote:
> Looking at the patches you sent is on my TODO list for this week at least=
 as a
> priority, although I really would have hoped that someone from Intel would
> have looked by now since it's a regression on their end.

What regression are you talking about?

> =

> Gentle ping to Vsyrjala and Imre
> =

> On Mon, 2020-11-09 at 14:52 +0300, Kirill A. Shutemov wrote:
> > On Wed, Nov 04, 2020 at 04:58:14PM -0500, Lyude Paul wrote:
> > > ACK, I will send out a patch for this asap
> > =

> > Any update. AFAICS, v5.10-rc3 is still buggy.
> > =

> =

> -- =

> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
