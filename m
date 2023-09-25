Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C0B7AD9D4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E4F10E253;
	Mon, 25 Sep 2023 14:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752AE10E186;
 Mon, 25 Sep 2023 14:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695651260; x=1727187260;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JSKTHygMcOBqFj/2fOIZYPA5zR33u2EokK1KiHDkRl8=;
 b=KdZAG14T9/Ce3P/dllTlVvR5QcSU32Uoh2UrZd5o+0JhPA8KRrkGCK6r
 Gp3XionKNAtMzRLrSl8hvmXC7pKBHTAbtMNJG2nEszhex31/mI6N41aNm
 YFjHLjuZBT+lWhiZVxavLhTdIu9ty9TPcgmKNvPVfkbkTIeFhjETf84Nf
 xhG2hookgb6NPPggNU2OIGDFaCsRZBjkq+wmUZP78erYhVRUwtYLGgSEe
 pCt5t/PZfSpEJfrnZwHdvRuzj3TGVFQnc7MbCwALtQFqGn7hKs+UdWon/
 qC87cht2y6dXg6P8+rkyNUwfrIwNvrgyD9dtjQHsUoHvio3/ksTQV6egb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366319219"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="366319219"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="891699592"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="891699592"
Received: from nurqayrx-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.213.34.118])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:13:14 -0700
Date: Mon, 25 Sep 2023 16:14:10 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Zap some empty lines
Message-ID: <ZRGVsijpw4hjzYNz@ashyti-mobl2.lan>
References: <20230920085715.6905-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920085715.6905-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Wed, Sep 20, 2023 at 09:57:15AM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Recent refactoring left an unsightly block of empty lines. Remove them.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

as this isn't merged yet:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
