Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C804182AB5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D035B6EA84;
	Thu, 12 Mar 2020 08:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1262A6E97B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 13:22:16 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 06:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,541,1574150400"; d="scan'208";a="415562123"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga005.jf.intel.com with ESMTP; 11 Mar 2020 06:22:09 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jC1JK-008k1r-PI; Wed, 11 Mar 2020 15:22:10 +0200
Date: Wed, 11 Mar 2020 15:22:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Phong LE <ple@baylibre.com>
Subject: Re: [PATCH v2 4/4] MAINTAINERS: add it66121 HDMI bridge driver entry
Message-ID: <20200311132210.GP1922688@smile.fi.intel.com>
References: <20200311125135.30832-1-ple@baylibre.com>
 <20200311125135.30832-5-ple@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311125135.30832-5-ple@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
Cc: mark.rutland@arm.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, mchehab+samsung@kernel.org,
 sam@ravnborg.org, heiko.stuebner@theobroma-systems.com, icenowy@aosc.io,
 devicetree@vger.kernel.org, stephan@gerhold.net, jonas@kwiboo.se,
 robh+dt@kernel.org, Jonathan.Cameron@huawei.com, jernej.skrabec@siol.net,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 01:51:35PM +0100, Phong LE wrote:
> Add Neil Armstrong and myself as maintainers

Run parse-maintainers.pl to fix issues.

> Signed-off-by: Phong LE <ple@baylibre.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 37c2963226d4..3d722d723686 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8977,6 +8977,14 @@ T:	git git://linuxtv.org/anttip/media_tree.git
>  S:	Maintained
>  F:	drivers/media/tuners/it913x*
>  
> +ITE IT66121 HDMI BRIDGE DRIVER
> +M:	Phong LE <ple@baylibre.com>
> +M:	Neil Armstrong <narmstrong@baylibre.com>
> +S:	Maintained
> +F:	drivers/gpu/drm/bridge/ite-it66121.c
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> +
>  IVTV VIDEO4LINUX DRIVER
>  M:	Andy Walls <awalls@md.metrocast.net>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
