Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D607CBBD2CE
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 09:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3350010E343;
	Mon,  6 Oct 2025 07:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WI/xZhqE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A593F10E3BE;
 Mon,  6 Oct 2025 07:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759734167; x=1791270167;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=PXJ6MRuzR6aMbdgG6mYjkWRtJiUQB3/rHCe+G2vrpVk=;
 b=WI/xZhqEusHTiBVLmqPiXHdp6pPZ/h54VTG73rioOmbOTT1SHtMKzIv9
 yp9sAxOUf4xJVGdOyfAVUt4uEsVOD8AFxlBp8MHJOjp3wkr/Ishkrd3dD
 MjnYoxk/sqsL6P7Na8qaJkTb+JWBAEeI9y26SyY6iUWNsbvw4mAHd+uP6
 +I085RSG+LTpoTqTnbgl/WvCAMF8ncWtbWYMWVByNysEW7yt2yQCZlcEU
 ibcpQxR4rJ5wfyADQwjtt6CtrZIQ+pB/cMEy+gtcaikLXOil+vc7J7eTC
 WAAiC3NRZCDkG668sJg/+AFQ+PuwuUFtAofkwT4Hs+MhkgJbjRkSSP5pr A==;
X-CSE-ConnectionGUID: r3ZCRLZ1TJqiL8s/GWbd6w==
X-CSE-MsgGUID: jtp3V1jKTnW9GA+GnyS+jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73005296"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73005296"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 00:02:46 -0700
X-CSE-ConnectionGUID: iyLLkEz/SOGMrqj15F92Fg==
X-CSE-MsgGUID: u1fNJsPGSsy+WvwcoZPP1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="184096523"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.162])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 00:02:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
In-Reply-To: <v37d36nd7ues6fp53ncrqdzvmikzjn4pf427wztzatc3pvqhvn@kpg5jrkqbfc4>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
 <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
 <e42176e9-cac0-4142-b463-9eaf86906c46@linaro.org>
 <v37d36nd7ues6fp53ncrqdzvmikzjn4pf427wztzatc3pvqhvn@kpg5jrkqbfc4>
Date: Mon, 06 Oct 2025 10:02:40 +0300
Message-ID: <b3aec4bd094bb5f4a531907f295721438fe5f2d1@intel.com>
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

On Fri, 03 Oct 2025, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Fri, Oct 03, 2025 at 11:01:56AM +0200, Neil Armstrong wrote:
>> On 10/3/25 03:17, Dmitry Baryshkov wrote:
>> > On Thu, Oct 02, 2025 at 04:57:35PM -0700, Jessica Zhang wrote:
>> > > My current email will stop working soon. Update my email address to
>> > > jesszhan0024@gmail.com
>> > > 
>> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> > > ---
>> > >   MAINTAINERS | 4 ++--
>> > >   1 file changed, 2 insertions(+), 2 deletions(-)
>> > > 
>> > 
>> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> > 
>> > 
>> 
>> So dim complains you didn't review with the right address...
>> 
>> dim: ERROR: 261785a47e0b ("MAINTAINERS: Update Jessica Zhang's email address"): Mandatory Maintainer Acked-by missing., aborting
>> 
>> I guess it expects Dmitry Baryshkov <lumag@kernel.org>
>
> No. It is a known limitation of dim, it expects a maintainers's review,
> but there aer no maintainers for MAINTAINERS file. 

Yeah, maybe MAINTAINERS deserves an explicit exception in dim.


-- 
Jani Nikula, Intel
