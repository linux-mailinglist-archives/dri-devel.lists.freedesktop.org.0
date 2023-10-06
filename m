Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199D7BC050
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 22:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D9D10E569;
	Fri,  6 Oct 2023 20:29:07 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BA110E568;
 Fri,  6 Oct 2023 20:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696624145; x=1728160145;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l1EoTWF0skNxMTeiHW+G+cy8y9AhwpEQpWaAxlf+kZM=;
 b=DHUFsDkmvnJGem762dR5hFl4mS94ZUZhKa5vlyDNmqgi9h5cyK5Sj/cl
 J+0EHmurIpjYgyk7z4l7xAU1as45JDpJiaoJOcqzvnLGKzXwuqKTV8OMc
 3WD6v+nkGY9UMW3PPBAPNpRitnjF8WJYDS29/p1yHYRxJG6V9TNS0hfZd
 pgtHZAr6AvPj2CMv7T5dM3lb1X8HvhxVM6C8NnDM8JeXL6mqoQQ3DuqRa
 F+OiEPmtjRUe1Zymjz9tDMWjOoPqu8SpRkea2SEP6RfVNe9LsUIHTsblO
 FuRBkdlBwSzmwZz61umjk5pOjAQyX5rpC3ubw7Qagg1mTA3qMx5VCa0QK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="386657274"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="386657274"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 13:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="896013086"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="896013086"
Received: from pmanogar-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.157.100])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 13:27:29 -0700
Date: Fri, 6 Oct 2023 22:28:54 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Update 'recommended' version
 to 70.12.1 for DG2/ADL-S/ADL-P/MTL
Message-ID: <ZSBuBjhiihJ67C06@ashyti-mobl2.lan>
References: <20231006145801.161868-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006145801.161868-1-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

> The latest GuC has new features and new workarounds that we wish to
> enable. So let the universe know that it is useful to update their
> firmware.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
