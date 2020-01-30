Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18514DC19
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 14:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1836F9BA;
	Thu, 30 Jan 2020 13:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6896F9BA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 13:38:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 05:38:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,382,1574150400"; d="scan'208";a="224122912"
Received: from adlugosz-mobl1.ger.corp.intel.com (HELO [10.252.51.231])
 ([10.252.51.231])
 by fmsmga008.fm.intel.com with ESMTP; 30 Jan 2020 05:38:52 -0800
Subject: Re: [PATCH] MAINTAINERS: Add Thomas as drm-misc co-maintainer
To: Thomas Zimmermann <tzimmermann@suse.de>, maxime.ripard@bootlin.com,
 daniel.vetter@intel.com, airlied@linux.ie
References: <20200130120643.5759-1-tzimmermann@suse.de>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <9e795c82-847f-e0d8-0174-01da6e9f3b20@linux.intel.com>
Date: Thu, 30 Jan 2020 14:38:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200130120643.5759-1-tzimmermann@suse.de>
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 30-01-2020 om 13:06 schreef Thomas Zimmermann:
> Daniel asked me to serve as co-maintainer of the drm-misc tree.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 32ed67fe516f..3e6bc3681d2f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5444,6 +5444,7 @@ F:	include/linux/vga*
>  DRM DRIVERS AND MISC GPU PATCHES
>  M:	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>  M:	Maxime Ripard <mripard@kernel.org>
> +M:	Thomas Zimmermann <tzimmermann@suse.de>
>  W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
