Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB99539840E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 10:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6956E372;
	Wed,  2 Jun 2021 08:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D614A6E372;
 Wed,  2 Jun 2021 08:26:56 +0000 (UTC)
IronPort-SDR: 4GPXkZWuhVtiTcRKED4doO3wQc1Qw8gDLsUMlI96hhsu9wQfJDGGE/zNytm1XP3n9Lr74AgVqn
 5DzPp7ElHTLg==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="264916906"
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="264916906"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 01:26:55 -0700
IronPort-SDR: BC9wJka3Zyj+6dx+zjZsqHYQ49i5zviK0DxMAE3zf7vjuTTtlroFpQkShwq9LxCaGywLG3jg78
 2+Czmwevnb3Q==
X-IronPort-AV: E=Sophos;i="5.83,241,1616482800"; d="scan'208";a="635787562"
Received: from lmarkel-mobl1.ger.corp.intel.com (HELO [10.249.254.49])
 ([10.249.254.49])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 01:26:53 -0700
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Subject: Merging TTM branches through the Intel tree?
Message-ID: <a29eaef9-2457-1393-6757-40956811daf8@linux.intel.com>
Date: Wed, 2 Jun 2021 10:26:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Christian, Are you OK with merging the TTM brances from the i915 TTM 
enablement series through the intel tree?

Thanks,
Thomas


