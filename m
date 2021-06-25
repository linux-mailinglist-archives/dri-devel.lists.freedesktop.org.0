Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266A13B494C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 21:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E656EE40;
	Fri, 25 Jun 2021 19:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96756EE3F;
 Fri, 25 Jun 2021 19:44:14 +0000 (UTC)
IronPort-SDR: hK5MJXXj08KXJ02tYMUgC/6/MVvndcghEjsC79TDCLVKcbNXxk7HN125fmv2y0mwniMKRn9fwc
 xQEFcFLHwDKA==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="195028089"
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="195028089"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 12:44:13 -0700
IronPort-SDR: 6xVVWa4A8aYr0e8gW/rK9nny3LdzG5swiX4wAN/8owIMe46IsYhVDh1ewhLRTTlzDOuwXTw/+0
 azi+D9M38oHw==
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="453919100"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.75.245])
 ([10.209.75.245])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 12:44:13 -0700
Subject: Re: [PATCH 09/47] drm/i915/guc: Remove GuC stage descriptor, add lrc
 descriptor
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-10-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <82b5c879-2679-1540-7772-8da1cacf66f5@intel.com>
Date: Fri, 25 Jun 2021 12:44:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-10-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/24/2021 00:04, Matthew Brost wrote:
> Remove old GuC stage descriptor, add lrc descriptor which will be used
> by the new GuC interface implemented in this patch series.
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

