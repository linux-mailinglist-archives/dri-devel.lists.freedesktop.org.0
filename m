Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8B917344A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 10:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF026EEB0;
	Fri, 28 Feb 2020 09:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22306EEAF;
 Fri, 28 Feb 2020 09:40:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2020 01:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,495,1574150400"; d="scan'208";a="411354381"
Received: from unknown (HELO [10.249.39.159]) ([10.249.39.159])
 by orsmga005.jf.intel.com with ESMTP; 28 Feb 2020 01:40:29 -0800
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and impact
 on services
To: Erik Faye-Lund <erik.faye-lund@collabora.com>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <ece8ebe3-40ec-2457-02da-4fef19cbe8f6@intel.com>
Date: Fri, 28 Feb 2020 11:40:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 gstreamer-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/02/2020 11:28, Erik Faye-Lund wrote:
> On Fri, 2020-02-28 at 13:37 +1000, Dave Airlie wrote:
>> On Fri, 28 Feb 2020 at 07:27, Daniel Vetter <daniel.vetter@ffwll.ch>
>> wrote:
>>> Hi all,
>>>
>>> You might have read the short take in the X.org board meeting
>>> minutes
>>> already, here's the long version.
>>>
>>> The good news: gitlab.fd.o has become very popular with our
>>> communities, and is used extensively. This especially includes all
>>> the
>>> CI integration. Modern development process and tooling, yay!
>>>
>>> The bad news: The cost in growth has also been tremendous, and it's
>>> breaking our bank account. With reasonable estimates for continued
>>> growth we're expecting hosting expenses totalling 75k USD this
>>> year,
>>> and 90k USD next year. With the current sponsors we've set up we
>>> can't
>>> sustain that. We estimate that hosting expenses for gitlab.fd.o
>>> without any of the CI features enabled would total 30k USD, which
>>> is
>>> within X.org's ability to support through various sponsorships,
>>> mostly
>>> through XDC.
>>>
>>> Note that X.org does no longer sponsor any CI runners themselves,
>>> we've stopped that. The huge additional expenses are all just in
>>> storing and serving build artifacts and images to outside CI
>>> runners
>>> sponsored by various companies. A related topic is that with the
>>> growth in fd.o it's becoming infeasible to maintain it all on
>>> volunteer admin time. X.org is therefore also looking for admin
>>> sponsorship, at least medium term.
>>>
>>> Assuming that we want cash flow reserves for one year of
>>> gitlab.fd.o
>>> (without CI support) and a trimmed XDC and assuming no sponsor
>>> payment
>>> meanwhile, we'd have to cut CI services somewhere between May and
>>> June
>>> this year. The board is of course working on acquiring sponsors,
>>> but
>>> filling a shortfall of this magnitude is neither easy nor quick
>>> work,
>>> and we therefore decided to give an early warning as soon as
>>> possible.
>>> Any help in finding sponsors for fd.o is very much appreciated.
>> a) Ouch.
>>
>> b) we probably need to take a large step back here.
>>
> I kinda agree, but maybe the step doesn't have to be *too* large?
>
> I wonder if we could solve this by restructuring the project a bit. I'm
> talking purely from a Mesa point of view here, so it might not solve
> the full problem, but:
>
> 1. It feels silly that we need to test changes to e.g the i965 driver
> on dragonboards. We only have a big "do not run CI at all" escape-
> hatch.


Yeah, changes on vulkan drivers or backend compilers should be fairly 
sandboxed.

We also have tools that only work for intel stuff, that should never 
trigger anything on other people's HW.

Could something be worked out using the tags?


-Lionel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
