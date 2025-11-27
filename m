Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38919C8EC39
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 15:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460AA10E75C;
	Thu, 27 Nov 2025 14:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dV+imn4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6D810E75C;
 Thu, 27 Nov 2025 14:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764253928; x=1795789928;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=MeqofkMO/FGbbwnByjSvkmN22VGurYbg+mFWzPJkLHE=;
 b=dV+imn4aEqNuLPqrNxs6YgufyYjWrbfl7I1eHFcYt7efhVM0ktrh0Gw0
 5fON543o6F/UcK/kiRIVi4BnnJsk/ukuefcEwzYCrgKq472seFeji6mNX
 rg/4rcXCzKhGawz8wgzmC22l8MiCq6+5eUfZevSJNNMR+gnFfKIJ6nL5Q
 xwdB7DK7/1Tco2F49wgfvKgAuYeLchOBjA+uojXaie4IGKk0Y+a92r9SC
 5PUrVBYHyTkJZGqXV0mcaqTywKjSYYFUdVcHCUCdkkCsPTSn5mq5fqO0s
 15ZALhs/U0w61db1xxJbSBwU6HLedGXJmBEN5j16KqYkXnIjHBnfh+0Ze Q==;
X-CSE-ConnectionGUID: 81/MlTj8RcKxJ+DtcuESkg==
X-CSE-MsgGUID: 7JXT4BjVTLK24cLqHZoOEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83911081"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="83911081"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 06:32:07 -0800
X-CSE-ConnectionGUID: Qt+EYYhrSNG9TDBAjpHoMg==
X-CSE-MsgGUID: /abgAvmqQiebHxtUzVcTew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="223942766"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 06:32:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Remove myself from xe maintainers
In-Reply-To: <20251126224357.2482051-2-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251126224357.2482051-2-lucas.demarchi@intel.com>
Date: Thu, 27 Nov 2025 16:32:01 +0200
Message-ID: <f6119d24b52423a1b5c5e7fd3b673d3d3737d132@intel.com>
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

On Wed, 26 Nov 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> As I'm leaving Intel soon, drop myself from the list of Xe maintainers.
> Also update the mailmap to switch to my kernel.org address.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.mailmap b/.mailmap
> index af6e4fce9bfe1..716c0573db214 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -476,6 +476,7 @@ Lorenzo Pieralisi <lpieralisi@kernel.org> <lorenzo.pi=
eralisi@arm.com>
>  Lorenzo Stoakes <lorenzo.stoakes@oracle.com> <lstoakes@gmail.com>
>  Luca Ceresoli <luca.ceresoli@bootlin.com> <luca@lucaceresoli.net>
>  Luca Weiss <luca@lucaweiss.eu> <luca@z3ntu.xyz>
> +Lucas De Marchi <demarchi@kernel.org> <lucas.demarchi@intel.com>
>  Lukasz Luba <lukasz.luba@arm.com> <l.luba@partner.samsung.com>
>  Luo Jie <quic_luoj@quicinc.com> <luoj@codeaurora.org>
>  Lance Yang <lance.yang@linux.dev> <ioworker0@gmail.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index acc951f122eaf..c3fe83ea713cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12517,7 +12517,6 @@ F:	include/drm/intel/
>  F:	include/uapi/drm/i915_drm.h
>=20=20
>  INTEL DRM XE DRIVER (Lunar Lake and newer)
> -M:	Lucas De Marchi <lucas.demarchi@intel.com>
>  M:	Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>  M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
>  L:	intel-xe@lists.freedesktop.org

--=20
Jani Nikula, Intel
