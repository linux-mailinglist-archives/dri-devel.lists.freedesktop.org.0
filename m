Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FE7252B10
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 12:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2C26E106;
	Wed, 26 Aug 2020 10:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FF96E106;
 Wed, 26 Aug 2020 10:02:47 +0000 (UTC)
IronPort-SDR: 4J4Z0p7Fx4h4gkFHwJr+xHdcg0hj1je4WW9LCYD8l36EDAhfxmhn4Q39V40+B6sHH4Yjwj/MlU
 yp2bedozizVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="153836093"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; d="scan'208";a="153836093"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 03:02:46 -0700
IronPort-SDR: hTW03OiJetmuVTvPOubt55QsvItuwZ2hIwphzV/U8+t44Rsp4D0PYQkLzqffzXBRXLXqIPzK85
 6IzTBFmw++hg==
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; d="scan'208";a="443969722"
Received: from jguenthe-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.32.223])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 03:02:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PULL] drm-misc-next
In-Reply-To: <20200820125644.hee2jjtnef5bf74o@gilmour.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200820125644.hee2jjtnef5bf74o@gilmour.lan>
Date: Wed, 26 Aug 2020 13:02:39 +0300
Message-ID: <87lfi167y8.fsf@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Aug 2020, Maxime Ripard <maxime@cerno.tech> wrote:
> This PR diffstat is pretty massive since we merged 5.9-rc1 and it's not (yet?) in drm-next.
>
> I'm not entirely sure how to tackle this (if it causes an issue?).
>
> Let me know, thanks!

Whatever Dave & Daniel say, but previously the rule of thumb has been to
only ever do backmerges from drm-next. If you need a backmerge from
Linus' tree, you ask for a backmerge to drm-next, and then backmerge
that.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
