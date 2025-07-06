Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB0AF9AEB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 20:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC63A10EA5D;
	Fri,  4 Jul 2025 18:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqgYoNqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E39D10EA5D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 18:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751655254; x=1783191254;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9us3u8dMglkUh2itXDDjCeO2cuGHG/qkSgoIX/es3Yw=;
 b=OqgYoNqrL2GNbUH3zLtNsh5ZKrka/AXt4Upz5M27K0su9DwmLVKqTD8v
 rhcraojAegjRIwXdu8oAxedKbFWUUEkthHdb75Za7AdCg5FHVyp9zG0x7
 xyfqj5JSO7YDMZWxxrhoO10GVYT8ZgmhxH2lQ/+65D0RH/f2NFMGGumSK
 UcKAWXOF28y5ypWhQloPjzgVv5mUo8OAcbrigJQn47SXFEJj2CSwUnuTc
 LLjtXPzvEN9ZzTOubjVpICIOp91D8I7GYh1JO4a9rCbhOMuB62uAaaFbF
 DoGtxdrb2yc/Jvl0Hxu7GEqkOM314XRhPZP8IAVohneW+AveRtLbGld8S Q==;
X-CSE-ConnectionGUID: z1cQA0J7TTmopxe14aMsMg==
X-CSE-MsgGUID: Nc5/TsN7RcetSoyzjlHPjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="65440164"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="65440164"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 11:54:14 -0700
X-CSE-ConnectionGUID: Pz+262ZJQ9q3wNK5hbYlww==
X-CSE-MsgGUID: EQicEOqNQP6fv0ph3elCjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="158962062"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 11:54:11 -0700
Date: Fri, 4 Jul 2025 21:54:08 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 airlied@gmail.com, simona@ffwll.ch,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v3 1/3] drm/doc: Fix title underline for "Task information"
Message-ID: <aGgjUCGr-NKeJ5pz@black.fi.intel.com>
References: <20250627171715.438304-1-andrealmeid@igalia.com>
 <aGggPuSCEK_opydS@black.fi.intel.com>
 <73a84621-400e-41f8-b3a3-96499fc3320b@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73a84621-400e-41f8-b3a3-96499fc3320b@igalia.com>
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

On Fri, Jul 04, 2025 at 03:49:36PM -0300, Andr� Almeida wrote:
> Em 04/07/2025 15:41, Raag Jadav escreveu:
> > On Fri, Jun 27, 2025 at 02:17:13PM -0300, Andr� Almeida wrote:
> > > Fix the following warning:
> > > 
> > > Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
> > > 
> > > Task information
> > > --------------- [docutils]
> > > 
> > > Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for the wedge API")
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Signed-off-by: Andr� Almeida <andrealmeid@igalia.com>
> > > ---
> > > v2: Add Reported-by tag
> > > ---
> > >   Documentation/gpu/drm-uapi.rst | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > > index 263e5a97c080..10dea6a1f097 100644
> > > --- a/Documentation/gpu/drm-uapi.rst
> > > +++ b/Documentation/gpu/drm-uapi.rst
> > > @@ -447,7 +447,7 @@ hang is usually the most critical one which can result in consequential hangs or
> > >   complete wedging.
> > >   Task information
> > > ----------------
> > > +----------------
> > >   The information about which application (if any) was involved in the device
> > >   wedging is useful for userspace if they want to notify the user about what
> > > @@ -728,4 +728,4 @@ Stable uAPI events
> > >   From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
> > >   .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> > > -   :doc: uAPI trace events
> > > \ No newline at end of file
> > > +   :doc: uAPI trace events
> > 
> > Unrelated change. Someone with a different editor added this and now
> > your editor disagrees with it.
> > 
> > Switching to binary mode usually fixes the issue.
> > 
> > Raag
> 
> After fixing that, can I add your Reviewed-by:?

Sure. Feel free to add,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
