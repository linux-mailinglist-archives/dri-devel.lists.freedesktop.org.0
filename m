Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AE2433A97
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 17:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C336EC18;
	Tue, 19 Oct 2021 15:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD916EC16;
 Tue, 19 Oct 2021 15:34:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="215471486"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="215471486"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 08:34:32 -0700
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="494152075"
Received: from jsanz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.211.239])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 08:34:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PULL] topic/drm-dp-training-delay-helpers for drm-misc-next and
 drm-intel-next
In-Reply-To: <20211019134749.xjyydm6xdcfe6hkm@gilmour>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <878ryps5b6.fsf@intel.com>
 <20211019134749.xjyydm6xdcfe6hkm@gilmour>
Date: Tue, 19 Oct 2021 18:34:25 +0300
Message-ID: <87zgr5owou.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 19 Oct 2021, Maxime Ripard <maxime@cerno.tech> wrote:
> On Tue, Oct 19, 2021 at 12:59:57PM +0300, Jani Nikula wrote:
>> 
>> Hi all -
>> 
>> These are the drm dp helpers for figuring out link training delays, to
>> be pulled to both drm-misc-next and drm-intel-next.
>> 
>> 
>> topic/drm-dp-training-delay-helpers-2021-10-19:
>> Core Changes:
>> - drm dp helpers for figuring out link training delays
>
> Merged into drm-misc-next, thanks!

And with that, also to drm-intel-next, thank you!

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
