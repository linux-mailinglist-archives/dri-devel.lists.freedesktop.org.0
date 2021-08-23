Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F763F481A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 12:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8663C89AEA;
	Mon, 23 Aug 2021 10:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40C589AEA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 10:01:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="213941437"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="213941437"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 03:01:19 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="574595914"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO [10.249.254.235])
 ([10.249.254.235])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 03:01:18 -0700
Subject: Re: Un-acked TTM patch
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <4da1794b868adf5de899c43bcc0780a6a10d492f.camel@linux.intel.com>
 <6f7555b1-f533-4bb5-1d11-07228f55d145@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <3894a035-54c6-2b88-839f-64888f7584de@linux.intel.com>
Date: Mon, 23 Aug 2021 12:01:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6f7555b1-f533-4bb5-1d11-07228f55d145@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 8/23/21 11:10 AM, Christian König wrote:
> Hi Thomas,
>
> sorry for the delay. I was on vacation and still digging though 
> everything.
>
> Just added an rb to the second patch, but can't find the first one 
> anywhere in my mailbox. Going to double check that on patchwork instead.
>
> Did you had a chance taking a look at the patches about moving the LRU 
> into the resources?
>
> Thanks,
> Christian.
>

Hi, Christian,

Yes, I just replied on two of those with a major concern. The other ones 
look OK from a cursory look, will dig a bit deeper into those If I can 
get some time over today.

Thanks,

Thomas

BTW is it ok to merge the TTM patch you r-b:d through drm-intel-next?

Thanks,

Thomas


