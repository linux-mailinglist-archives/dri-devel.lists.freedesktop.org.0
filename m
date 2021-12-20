Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569D547AE96
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 16:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C4311A634;
	Mon, 20 Dec 2021 15:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E0411A634
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 15:03:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="227041503"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="227041503"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 07:03:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="507712429"
Received: from ksulliv1-mobl.ger.corp.intel.com (HELO [10.252.58.34])
 ([10.252.58.34])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 07:03:26 -0800
Message-ID: <4de5b255-4f2d-870e-a7f2-05f5c0069cfe@linux.intel.com>
Date: Mon, 20 Dec 2021 16:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PATCH v8 0/6] Add Unisoc's drm kms module
Content-Language: en-US
To: Kevin Tang <kevin3.tang@gmail.com>, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com
References: <20211207142717.30296-1-kevin3.tang@gmail.com>
 <CAFPSGXaC1rMF+KLttBJvKzN=UxtFtRR1gO3L4cqdgPJu_jtQ_A@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <CAFPSGXaC1rMF+KLttBJvKzN=UxtFtRR1gO3L4cqdgPJu_jtQ_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 orsonzhai@gmail.com, pony1.wu@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20-12-2021 14:55, Kevin Tang wrote:
> Dear Maarten,
> I see it from the cgit.freedesktop.org, our sprd drivers seems has
> been merged into drm-misc.
>
> Now, what shall we do next?
>
> BR,
> Best wishes
>
> Kevin Tang <kevin3.tang@gmail.com> 于2021年12月7日周二 22:27写道：

You should apply for commit rights to drm-misc, so you can maintain it.

https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html

~Maarten

