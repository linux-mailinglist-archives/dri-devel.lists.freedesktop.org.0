Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE07F50E3A6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 16:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15AA10E941;
	Mon, 25 Apr 2022 14:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FFE10E941;
 Mon, 25 Apr 2022 14:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650898141; x=1682434141;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=46Ub++Kt9Nm1bCwZm9y9FDmqeiME8lXt/nAOh/21ffI=;
 b=ESWqLbQjzPnKCx5RTIzHFkA3mB+k1oD8iz3DsHJNVMgL5FFTqCubIsqI
 m+rlZHaro57uaW1VsfKZFXAz05b4fbusHW/FL0zGOuNrlLJ53yv6gX2YL
 jGVguVmhBh6Mu5oaApjAL3ZWqoRiUYqa3xm4VDn1OQ44L5MfAFc4XuWAh
 v4qkVc945XLLeIVrfnbxqyBIdpeaCs7OiWhqek9EEmMefYUAOoe6Z6ydk
 kEPRO0OV9TiGgXjyUx5jXBQP+xxo5S+xbPsZrmtU4Z+hvePNXnIYfzi/H
 ORR2DpEMVztY3eN/7TfbsY9i/WkwOgQJMrEIpvTn4Etl8Dy6BzvEW0BqG A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="252635808"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="252635808"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 07:49:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="557766818"
Received: from agaer-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.47.33])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 07:48:59 -0700
Date: Mon, 25 Apr 2022 16:48:55 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Xe_HP SDV and DG2 have up to 4
 CCS engines
Message-ID: <Yma014G1r272el29@intel.intel>
References: <20220422195007.4019661-1-matthew.d.roper@intel.com>
 <20220422195007.4019661-3-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422195007.4019661-3-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 22, 2022 at 12:50:07PM -0700, Matt Roper wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
