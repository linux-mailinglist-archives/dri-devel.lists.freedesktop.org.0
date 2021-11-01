Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A91A44241D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 00:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50BC6EC8F;
	Mon,  1 Nov 2021 23:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F193D6EC8F;
 Mon,  1 Nov 2021 23:35:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="231404980"
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="231404980"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 16:35:52 -0700
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="488853561"
Received: from ebijkerk-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.215.48])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 16:35:50 -0700
Date: Tue, 2 Nov 2021 00:35:48 +0100
From: Andi Shyti <andi.shyti@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 09/10] drm/i915/guc: Update CT debug macro for
 multi-tile
Message-ID: <YYB51Bkp6qOkFZVE@intel.intel>
References: <20211029032817.3747750-1-matthew.d.roper@intel.com>
 <20211029032817.3747750-10-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211029032817.3747750-10-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org, Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt and Michal,

On Thu, Oct 28, 2021 at 08:28:16PM -0700, Matt Roper wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Update CT debug macros by including tile ID in all messages.
> 
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
