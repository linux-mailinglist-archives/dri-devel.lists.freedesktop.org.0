Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3AC3AE4D3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 10:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE7B89D84;
	Mon, 21 Jun 2021 08:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F4489D7F;
 Mon, 21 Jun 2021 08:30:42 +0000 (UTC)
IronPort-SDR: 8Ha9C5XsDlR03YRWiosUAZhaKYSqEDQYhzJZRbuGsvj9zKnHBCBwuTaRM8855o5SvNi8mjsq4o
 B5QMxL+kq2AQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="206748295"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="206748295"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 01:30:40 -0700
IronPort-SDR: ubkVb9vNHYMxMHH5xFqDId2E0TQ5vB2zQ+KfAVZiyJCm5iiYEQryBCfIR88TAikqu7zQjlmHx3
 xhU8QSCu23iQ==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="489802096"
Received: from acoard-mobl.ger.corp.intel.com (HELO [10.213.248.125])
 ([10.213.248.125])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 01:30:38 -0700
Subject: Re: [PATCH v4] drm/i915: Document the Virtual Engine uAPI
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210618150036.2507653-1-tvrtko.ursulin@linux.intel.com>
 <CAKMK7uFPXPwWuL=3dR1gnCX-yGUPLOjK5Q1Vo=KHLzENm8oPFg@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9b592ab5-23c2-ea74-cc06-d0ec5d557dc8@linux.intel.com>
Date: Mon, 21 Jun 2021 09:30:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFPXPwWuL=3dR1gnCX-yGUPLOjK5Q1Vo=KHLzENm8oPFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx <Intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/06/2021 21:46, Daniel Vetter wrote:
> On Fri, Jun 18, 2021 at 5:00 PM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> A little bit of documentation covering the topics of engine discovery,
>> context engine maps and virtual engines. It is not very detailed but
>> supposed to be a starting point of giving a brief high level overview of
>> general principles and intended use cases.
>>
>> v2:
>>   * Have the text in uapi header and link from there.
>>
>> v4:
>>   * Link from driver-uapi.rst.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
> 
> Apologies for the confusion :-/
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Imo just push, it's good stuff at the right place, and it's much
> easier to polish&integrate docs better once something is there. I've
> read through it and it looks all nice.

Okay pushed, thanks.

Regards,

Tvrtko
