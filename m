Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B9546D6D3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 16:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBD16F626;
	Wed,  8 Dec 2021 15:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEBE6F524;
 Wed,  8 Dec 2021 15:20:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="324106435"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="324106435"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 07:20:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="503084391"
Received: from faerberc-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.209.148])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 07:20:44 -0800
Date: Wed, 8 Dec 2021 17:20:41 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915: Exclude reserved stolen from
 driver use
Message-ID: <YbDNSeTM894ml4i3@intel.intel>
References: <20211208145800.27246-1-ramalingam.c@intel.com>
 <20211208145800.27246-2-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208145800.27246-2-ramalingam.c@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ram,

On Wed, Dec 08, 2021 at 08:27:58PM +0530, Ramalingam C wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Remove the portion of stolen memory reserved for private use from driver
> access.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
