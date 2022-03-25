Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1354E7878
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 16:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B99910E95B;
	Fri, 25 Mar 2022 15:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5492F10E630;
 Fri, 25 Mar 2022 15:56:08 +0000 (UTC)
Received: from [192.168.0.7] (ip5f5aef76.dynamic.kabel-deutschland.de
 [95.90.239.118])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id E1B5161E64846;
 Fri, 25 Mar 2022 16:56:05 +0100 (CET)
Message-ID: <c62c2ef4-9223-b84d-b532-8f3acaaa80ff@molgen.mpg.de>
Date: Fri, 25 Mar 2022 16:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: Commit messages
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Stone <daniel@fooishbar.org>, Alex Deucher <alexdeucher@gmail.com>
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <7addb3e7-d265-c1a7-d449-7d0056f06d63@molgen.mpg.de>
 <fc60c561-c12a-c031-9558-abae3e3474ec@amd.com>
 <6f0888a2-f74d-f41f-d593-a8362e7dc673@molgen.mpg.de>
 <398f8851-d37b-4020-24ce-8f2ab9723e40@amd.com>
 <CAPj87rMETV9UkpbGRYAT3mjVhRtW75m0e9OLON6_+gdcD0Fo2Q@mail.gmail.com>
 <CADnq5_NuaN_ZziNipdqvvTQ41you==VqJg5oxQovowokaJ2K1Q@mail.gmail.com>
 <CAPj87rNyjd1xkEEARMoiaEdjLxy2rvcKa03fnNCnpN91DLhF1A@mail.gmail.com>
 <CADnq5_Mt5sWCC7hLLBH_DJdvXGqSTbNNaxWpY+cWWD9Vpa8KGQ@mail.gmail.com>
 <CAPj87rPhuVTDJSsY-HsKfvV3xkDhEn7nUd3WLsxNuJD=Mx2Zxg@mail.gmail.com>
 <c41203c8-841b-889f-5c9b-5982ee961849@amd.com>
Content-Language: en-US
In-Reply-To: <c41203c8-841b-889f-5c9b-5982ee961849@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: amd-gfx@lists.freedesktop.org,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>,
 Alexander Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Christian, dear Daniel, dear Alex,


Am 23.03.22 um 16:32 schrieb Christian König:
> Am 23.03.22 um 16:24 schrieb Daniel Stone:
>> On Wed, 23 Mar 2022 at 15:14, Alex Deucher <alexdeucher@gmail.com> wrote:
>>> On Wed, Mar 23, 2022 at 11:04 AM Daniel Stone <daniel@fooishbar.org> 
>>> wrote:
>>>> That's not what anyone's saying here ...
>>>>
>>>> No-one's demanding AMD publish RTL, or internal design docs, or
>>>> hardware specs, or URLs to JIRA tickets no-one can access.
>>>>
>>>> This is a large and invasive commit with pretty big ramifications;
>>>> containing exactly two lines of commit message, one of which just
>>>> duplicates the subject.
>>>>
>>>> It cannot be the case that it's completely impossible to provide any
>>>> justification, background, or details, about this commit being made.
>>>> Unless, of course, it's to fix a non-public security issue, that is
>>>> reasonable justification for eliding some of the details. But then
>>>> again, 'huge change which is very deliberately opaque' is a really
>>>> good way to draw a lot of attention to the commit, and it would be
>>>> better to provide more detail about the change to help it slip under
>>>> the radar.
>>>>
>>>> If dri-devel@ isn't allowed to inquire about patches which are posted,
>>>> then CCing the list is just a façade; might as well just do it all
>>>> internally and periodically dump out pull requests.
>>> I think we are in agreement. I think the withheld information
>>> Christian was referring to was on another thread with Christian and
>>> Paul discussing a workaround for a hardware bug:
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Famd-gfx%2Fmsg75908.html&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C6a3f2815d83b4872577008da0ce1347a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637836458652370599%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=QtNB0XHMhTgH%2FNHMwF23Qn%2BgSdYyHJSenbpP%2FHG%2BkxE%3D&amp;reserved=0 

(Thank you Microsoft for keeping us safe.)

I guess it proves, how assuming what other people should know/have read, 
especially when crossing message threads, is causing confusion and 
misunderstandings.

>> Right, that definitely seems like some crossed wires. I don't see
>> anything wrong with that commit at all: the commit message and a
>> comment notes that there is a hardware issue preventing Raven from
>> being able to do TMZ+GTT, and the code does the very straightforward
>> and obvious thing to ensure that on VCN 1.0, any TMZ buffer must be
>> VRAM-placed.

My questions were:

> Where is that documented, and how can this be reproduced? 

Shouldn’t these be answered by the commit message? In five(?) years, 
somebody, maybe even with access to the currently non-public documents, 
finds a fault in the commit, and would be helped by having an 
document/errata number where to look at. To verify the fix, the 
developer would need a method to produce the error, so why not just 
share it?

Also, I assume that workarounds often come with downsides, as otherwise 
it would have been programmed like this from the beginning, or instead 
of “workaround” it would be called “improvement”. Shouldn’t that also be 
answered?

So totally made-up example:

Currently, there is a graphics corruption running X on system Y. This is 
caused by a hardware bug in Raven ASIC (details internal document 
#NNNN/AMD-Jira #N), and can be worked around by [what is in the commit 
message].

The workaround does not affect the performance, and testing X shows the 
error is fixed.

>> This one, on the other hand, is much less clear ...
> 
> Yes, completely agree. I mean a good bunch of comments on commit 
> messages are certainly valid and we could improve them.

That’d be great.

> But this patch here was worked on by both AMD and Intel developers. 
> Where both sides and I think even people from other companies perfectly 
> understands why, what, how etc...
> 
> When now somebody comes along and asks for a whole explanation of the 
> context why we do it then that sounds really strange to me.

The motivation should be part of the commit message. I didn’t mean 
anyone to rewrite buddy memory allocator Wikipedia article [1]. But the 
commit message at hand for switching the allocator is definitely too terse.


Kind regards,

Paul


[1]: https://en.wikipedia.org/wiki/Buddy_memory_allocation
