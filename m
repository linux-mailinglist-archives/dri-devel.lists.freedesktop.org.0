Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDF13958B8
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 12:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4756E8C9;
	Mon, 31 May 2021 10:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FD66E8CD
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 10:05:37 +0000 (UTC)
IronPort-SDR: fzIa0rfsIQcdoa6QxNRGz2r3BtnCvRYm0LJVJC1kNAu0WCd/YTX8LDYFRLkYiSrmzQPrJeyZk8
 po46kpu0A3kg==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="264523885"
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="264523885"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 03:05:36 -0700
IronPort-SDR: aiEekzZjHSD7NbXYCaWUaCjaPWTrU5fbNnwzeXalSbsjlVmoyla3MzplSTYaxNjeXYNX37Rg25
 ebkyyQn5meYA==
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="478858881"
Received: from masayag-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.52.77])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 03:05:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] maintainers: Update freedesktop.org IRC channels
In-Reply-To: <20210531031029.4642-2-alyssa@rosenzweig.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210531031029.4642-1-alyssa@rosenzweig.io>
 <20210531031029.4642-2-alyssa@rosenzweig.io>
Date: Mon, 31 May 2021 13:05:29 +0300
Message-ID: <87zgwbqkuu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, Hector Martin <marcan@marcan.st>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 30 May 2021, Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
> Like many free software projects, freedesktop.org issued a non-binding
> recommendation for projects to migrate from Freenode to OFTC [1]. As
> such, freedesktop.org entries in the MAINTAINERS file are out-of-date as
> the respective channels have moved. Update the file to point to the
> right network.
>
> v2: Correct typo in commit message pointed out by Lukas and Jonathan.
> Add Hector's ack.
>
> [1] https://lists.freedesktop.org/archives/dri-devel/2021-May/307605.html
>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Acked-By: Hector Martin <marcan@marcan.st>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Cc: linux-kernel@vger.kernel.org

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 49091fbfa..7f992125a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1651,7 +1651,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated =
for non-subscribers)
>  S:	Maintained
>  W:	https://asahilinux.org
>  B:	https://github.com/AsahiLinux/linux/issues
> -C:	irc://chat.freenode.net/asahi-dev
> +C:	irc://irc.oftc.net/asahi-dev
>  T:	git https://github.com/AsahiLinux/linux.git
>  F:	Documentation/devicetree/bindings/arm/apple.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> @@ -5969,7 +5969,7 @@ M:	Daniel Vetter <daniel@ffwll.ch>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  B:	https://gitlab.freedesktop.org/drm
> -C:	irc://chat.freenode.net/dri-devel
> +C:	irc://irc.oftc.net/dri-devel
>  T:	git git://anongit.freedesktop.org/drm/drm
>  F:	Documentation/devicetree/bindings/display/
>  F:	Documentation/devicetree/bindings/gpu/
> @@ -9116,7 +9116,7 @@ S:	Supported
>  W:	https://01.org/linuxgraphics/
>  Q:	http://patchwork.freedesktop.org/project/intel-gfx/
>  B:	https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs
> -C:	irc://chat.freenode.net/intel-gfx
> +C:	irc://irc.oftc.net/intel-gfx
>  T:	git git://anongit.freedesktop.org/drm-intel
>  F:	Documentation/gpu/i915.rst
>  F:	drivers/gpu/drm/i915/

--=20
Jani Nikula, Intel Open Source Graphics Center
