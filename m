Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 853F9131335
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 14:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B54A6E2C7;
	Mon,  6 Jan 2020 13:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800D66E2C7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 13:49:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 05:49:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,402,1571727600"; d="scan'208";a="232829962"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga002.jf.intel.com with ESMTP; 06 Jan 2020 05:49:38 -0800
Received: from fmsmsx125.amr.corp.intel.com (10.18.125.40) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 6 Jan 2020 05:49:38 -0800
Received: from fmsmsx116.amr.corp.intel.com ([169.254.2.67]) by
 FMSMSX125.amr.corp.intel.com ([169.254.2.63]) with mapi id 14.03.0439.000;
 Mon, 6 Jan 2020 05:49:38 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "Engestrom, Eric" <eric.engestrom@intel.com>
Subject: Re: Requesting commit access to libdrm
Thread-Topic: Requesting commit access to libdrm
Thread-Index: AQHVtDEPdA2krL+40k21UvSU+RCuuafR5g0AgAxn7AA=
Date: Mon, 6 Jan 2020 13:49:37 +0000
Message-ID: <ebff18e2d47ff8dd672aca084af83405acbf5041.camel@intel.com>
References: <3f7684b82dab9f5294dce76ad0a997e368759d2d.camel@intel.com>
 <20191229162212.2mfnarunvgxahydt@intel.com>
In-Reply-To: <20191229162212.2mfnarunvgxahydt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.251.149.63]
Content-ID: <6936939D09D06545BDEA6A90CD5CCEC5@intel.com>
MIME-Version: 1.0
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2019-12-29 at 16:22 +0000, Eric Engestrom wrote:
> On Monday, 2019-12-16 16:51:28 +0000, Souza, Jose wrote:
> > Hello
> > 
> > I have being contributing to i915 for the past 2 years and part of
> > my
> > work is update the PCI ids of Intel devices in libdrm.
> > Being able to push my reviewed patches would be really helpful,
> > please
> > consider this request.
> 
> This is somewhat orthogonal to your access request, but libdrm now
> uses
> Merge Requests (
> https://gitlab.freedesktop.org/mesa/drm/merge_requests),
> which means if you post a change and it's been reviewed, any one of
> the
> 100+ members can click the "merge" button for you, so not having
> access
> yourself shouldn't be an issue, especially with the number of Intel
> devs
> who do have access.

So CONTRIBUTING.rst should be updated with that new option but I bet
most of the devs will keep only checking the mail list.

> 
> (It also means changes are tested (although mostly build-tested for
> now)
> before they are merged, which reduces the frequency of breakages,
> especially subtle ones.)
> 
> You can still request access if you want by opening an issue
> (https://gitlab.freedesktop.org/mesa/drm/issues/new), but since you
> have
> very few commits you'll need approval from another member; I suggest
> you
> cc Lucas (@demarchi) & Rodrigo (@vivijim) by tagging them in your
> issue.

That should also be in CONTRIBUTING.rst

> 
> Hope this helps :)

I will talk with Lucas and Rodrigo, thanks for bringing light to the
new process

Thanks

> 
> Cheers,
>   Eric
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
