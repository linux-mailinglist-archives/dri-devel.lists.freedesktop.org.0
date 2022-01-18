Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A0149215B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 09:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CE411292A;
	Tue, 18 Jan 2022 08:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E60112934
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 08:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642495098; x=1674031098;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FhVSDuFXzCYwf0ycFrcVmxrINtgqM1+o6yYDqyQgb7c=;
 b=bPUVhYu26w0x8z6mGkmZqalsNVhwvNKWwq608tWrcQle6S4e2Cd1yVB8
 C4XkTuDNEX/qF7WCa8IxnWC2AHSDYGcObOv3UYATiOX5SueTLImZ0dSGm
 tdhvplRE0bilGgF6FF/i3H8zfg8jCx21dSzeCApeBkxSkHoi1yPLTuPKd
 R6CH7SC7Yh7I4m3SiKYTCDlVEtEc3CJFcuy/bcOFinj2TOWJAe4SuqQG6
 dpdVG+lfhcg4gHgStMIs/MF4rTdcfS8cDt32SLVBuEvS/lcIlstx6kYcw
 ELYPIa5JUlh0AxW2sHzpWk9MpgTm4WWRvhuMV515YIZc7fte31lIFk+CA g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="331117660"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="331117660"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 00:38:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="625435611"
Received: from alexruss-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.3.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 00:38:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
In-Reply-To: <4f1d6018-d74e-8e62-ea4d-0ca79c6bbbc5@gmx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <CAKMK7uHVHn9apB6YYbLSwu+adEB2Fqp4FM0z582zf4F-v3_GnQ@mail.gmail.com>
 <cf21018b-f231-7538-169e-2ad450643cbf@gmx.de>
 <97d49bca-f5f7-dba4-b62d-b6fcdd4276ac@suse.de> <87ee5659dt.fsf@intel.com>
 <4f1d6018-d74e-8e62-ea4d-0ca79c6bbbc5@gmx.de>
Date: Tue, 18 Jan 2022 10:38:04 +0200
Message-ID: <87a6ft5thv.fsf@intel.com>
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

On Mon, 17 Jan 2022, Helge Deller <deller@gmx.de> wrote:
> On 1/17/22 22:40, Jani Nikula wrote:
>> On Mon, 17 Jan 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Seems like few people read linux-fbdev these days.
>>
>> How much traffic is there to linux-fbdev that is *not* Cc'd to dri-devel
>> also?
>
> Doesn't seem like much traffic - which IMHO is OK for such a tree with
> mostly just maintenance patches.
>
>> Do we still need a separate linux-fbdev mailing list at all?
>
> Yes. I want to have it seperate of dri-devel.
> Actually I'd prefer to drop dri-devel from the list where patches
> for fbdev are sent...

Disagreed. If anything, this thread shows we can't have fbdev and drm in
silos of their own.

Also, if the patches continue to get merged through drm-misc, they need
to be sent to dri-devel.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
