Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5507298E7
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9804D10E692;
	Fri,  9 Jun 2023 12:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F2B10E691
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686312056; x=1717848056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oGy0tnOsIMO/gl2a+BAJqrOm+qw2zjtT8uyD9gXInPM=;
 b=GaM/VMyvgXmR5rKE7wsWM2ysoMl61SuSHX3nO5c+M+2UFFygV6OFS09y
 bbZ2B97U4cQdX5oHIkrccWIT4F/2Ejx5dhZIXzCVIUwq6+5O+BWwr/yKt
 Zn5Rtb9Wgag4tyChITpit1ayrP9bjkOw+M1W8hT8SDRl8E88+7LC1tYe6
 HKg7QXZ8lIWEJl7LMoEJrATt0UVjrxxeT5iaWCswoH/81+PrByzYeedqb
 49Ul+ww/JjTsRBLxAA2wk6yihcrbN+kBPjr2/Q5B8ZecwieoxBX9IgtEx
 iwdaBcitH1qPZgNzS1HnVDp4Lobr/SSO+t1NfQcq4ZksdEDD/zEwTnYO2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337216303"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="337216303"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:00:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="743467635"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="743467635"
Received: from lmirabel-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.211.108])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:00:52 -0700
Date: Fri, 9 Jun 2023 14:00:42 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v5 4/4] PCI/VGA: Replace full MIT license text with SPDX
 identifier
Message-ID: <ZIMUakQMGI9ugf8M@ashyti-mobl2.lan>
References: <20230609112417.632313-1-suijingfeng@loongson.cn>
 <20230609112417.632313-4-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609112417.632313-4-suijingfeng@loongson.cn>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 09, 2023 at 07:24:17PM +0800, Sui Jingfeng wrote:
> Per Documentation/process/license-rules.rst, the SPDX MIT identifier is
> equivalent to including the entire MIT license text from
> LICENSES/preferred/MIT.
> 
> Replace the MIT license text with the equivalent SPDX identifier.
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
