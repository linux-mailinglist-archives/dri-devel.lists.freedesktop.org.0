Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BFC49115E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 22:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9350310FE4B;
	Mon, 17 Jan 2022 21:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4650810FE4B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 21:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642455628; x=1673991628;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HtUPxF3I/Nek045AhvkduD0dgoN3i5w23EDYGoJRe1c=;
 b=XXhx3PcYgZbs/ogNAT18ucKKfwVNuVSpzx16qEiIKfAZbDAOakJIQnMo
 /9MvNr78sYVzm6Y715YhhAGLHLTM/43l28y+42mDQTgzAXP9gX/9UsP04
 Oc7STOZyWo4qPFAiP2s6Koiemy3ou20+04LU59xsXthOrhZ0UQ5MSzOm0
 NrBAcCVWBWC1BWs02GyO5CY4FUA9jJP033NjG9xRGHTNShFfXm2yL2dFK
 bsPX2RRg+W1q2hG226wenzKkhjTOCLY2SIMtIPcOxpPx5vU1wf7Sx/dU4
 I39l9Jap1prtqDmKyExO5IHFQXHxrNguqnoaJzy32ou7uel9mhDGrREsL g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="244492909"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="244492909"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 13:40:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="625305131"
Received: from neiljwal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.3.1])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 13:40:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
In-Reply-To: <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de>
Date: Mon, 17 Jan 2022 23:40:14 +0200
Message-ID: <87ee5659dt.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Jan 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Seems like few people read linux-fbdev these days.

How much traffic is there to linux-fbdev that is *not* Cc'd to dri-devel
also? Do we still need a separate linux-fbdev mailing list at all?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
