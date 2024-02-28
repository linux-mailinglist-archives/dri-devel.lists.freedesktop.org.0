Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFCC86B278
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314E910EA00;
	Wed, 28 Feb 2024 14:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldhPtvEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7F910E9FF;
 Wed, 28 Feb 2024 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709132177; x=1740668177;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=XHKMIZTbj9bitp8a+76rJdKa+WSqMzI2I1WztVw5LMs=;
 b=ldhPtvEyKUEi9wX8apsTF+IBN9g/nfLQK95HtemVlVbmJKtAve2DLusR
 T8Qksx13m+4oRpCHmBYJ6uv/QEXZDccaRAdj6y1H5Q3WjtMyjpwOFCk7d
 nMyKy9XtUDQUYF469YCM9ERpv3wq4yNgj6aDDbpkjvAskKv7rbKnmFOO1
 +WvbSqsOzgwf+W9WiO1TSxcM48SOpfc8N+LcM06+LDIi6NxzSQu8uTN/g
 382BJoOyAfhchP12Kol1CjiiiuXHlOpRfxDRRiC67R3RtAsHQnTAWi0nS
 H8b5gXiGLZ1a17zMY3DFZXPx6gFx31je6icKZCCyB0xxxsKVFCadouBQL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14952692"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="14952692"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:56:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="12121542"
Received: from tmelzer-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.32.33])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:56:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Daniel Vetter
 <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Update email address for Tvrtko Ursulin
In-Reply-To: <20240228142240.2539358-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240228142240.2539358-1-tvrtko.ursulin@linux.intel.com>
Date: Wed, 28 Feb 2024 16:56:09 +0200
Message-ID: <8734tcab92.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 28 Feb 2024, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> I will lose access to my @.*intel.com e-mail addresses soon so let me
> adjust the maintainers entry and update the mailmap too.
>
> While at it consolidate a few other of my old emails to point to the
> main one.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  .mailmap    | 5 +++++
>  MAINTAINERS | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/.mailmap b/.mailmap
> index b99a238ee3bd..d67e351bce8e 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -608,6 +608,11 @@ TripleX Chung <xxx.phy@gmail.com> <triplex@zh-kernel=
.org>
>  TripleX Chung <xxx.phy@gmail.com> <zhongyu@18mail.cn>
>  Tsuneo Yoshioka <Tsuneo.Yoshioka@f-secure.com>
>  Tudor Ambarus <tudor.ambarus@linaro.org> <tudor.ambarus@microchip.com>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@intel.com>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@linux.intel.com>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@sophos.com>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@onelan.co.uk>
> +Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko@ursulin.net>
>  Tycho Andersen <tycho@tycho.pizza> <tycho@tycho.ws>
>  Tzung-Bi Shih <tzungbi@kernel.org> <tzungbi@google.com>
>  Uwe Kleine-K=C3=B6nig <ukleinek@informatik.uni-freiburg.de>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 19f6f8014f94..b940bfe2a692 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10734,7 +10734,7 @@ INTEL DRM I915 DRIVER (Meteor Lake, DG2 and older=
 excluding Poulsbo, Moorestown
>  M:	Jani Nikula <jani.nikula@linux.intel.com>
>  M:	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>  M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
> -M:	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> +M:	Tvrtko Ursulin <tursulin@ursulin.net>
>  L:	intel-gfx@lists.freedesktop.org
>  S:	Supported
>  W:	https://drm.pages.freedesktop.org/intel-docs/

--=20
Jani Nikula, Intel
