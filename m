Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F7944EC33
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 18:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C32C6E0B6;
	Fri, 12 Nov 2021 17:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu
 [128.30.2.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 17D686E0B6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 17:50:52 +0000 (UTC)
Received: from c-24-16-8-193.hsd1.wa.comcast.net ([24.16.8.193]
 helo=srivatsab-a02.vmware.com)
 by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
 (Exim 4.82) (envelope-from <srivatsa@csail.mit.edu>)
 id 1mlahI-0006py-1E; Fri, 12 Nov 2021 12:50:44 -0500
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Mark VMware mailing list entries as
 email aliases
To: Jakub Kicinski <kuba@kernel.org>, Joe Perches <joe@perches.com>
References: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
 <163657493334.84207.11063282485812745766.stgit@srivatsa-dev>
 <20211110173935.45a9f495@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <d7f3fec79287a149d6edc828583a771c84646b42.camel@perches.com>
 <20211111055554.4f257fd2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Message-ID: <fd9df647-4c1a-b4fb-159b-4876bc5cd0b6@csail.mit.edu>
Date: Fri, 12 Nov 2021 09:50:33 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211111055554.4f257fd2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Ronak Doshi <doshir@vmware.com>, pv-drivers@vmware.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Nadav Amit <namit@vmware.com>, amakhalov@vmware.com, srivatsa@csail.mit.edu,
 srivatsab@vmware.com, sdeep@vmware.com, linux-scsi@vger.kernel.org,
 Vishal Bhakta <vbhakta@vmware.com>, x86@kernel.org,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 rostedt@goodmis.org, keerthanak@vmware.com, jgross@suse.com, anishs@vmware.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Vivek Thampi <vithampi@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[ Resending since my previous reply didn't reach the mailing lists. ]

On 11/11/21 5:55 AM, Jakub Kicinski wrote:
> On Wed, 10 Nov 2021 21:19:53 -0800 Joe Perches wrote:
>> On Wed, 2021-11-10 at 17:39 -0800, Jakub Kicinski wrote:
>>> On Wed, 10 Nov 2021 12:09:06 -0800 Srivatsa S. Bhat wrote:  
>>>>  DRM DRIVER FOR VMWARE VIRTUAL GPU
>>>> -M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
>>>>  M:	Zack Rusin <zackr@vmware.com>
>>>> +R:	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
>>>>  L:	dri-devel@lists.freedesktop.org
>>>>  S:	Supported
>>>>  T:	git git://anongit.freedesktop.org/drm/drm-misc  
>>>
>>> It'd be preferable for these corporate entries to be marked or
>>> otherwise distinguishable so that we can ignore them when we try 
>>> to purge MAINTAINERS from developers who stopped participating.
>>>
>>> These addresses will never show up in a commit tag which is normally
>>> sign of inactivity.  
>>
>> Funny.
>>
>> The link below is from over 5 years ago.
>>
>> https://lore.kernel.org/lkml/1472081625.3746.217.camel@perches.com/
>>
>> Almost all of those entries are still in MAINTAINERS.
>>
>> I think the concept of purging is a non-issue.
> 
> I cleaned networking in January and intend to do it again in 2 months.
> See:
> 
> 054c4610bd05 MAINTAINERS: dccp: move Gerrit Renker to CREDITS
> 4f3786e01194 MAINTAINERS: ipvs: move Wensong Zhang to CREDITS
> 0e4ed0b62b5a MAINTAINERS: tls: move Aviad to CREDITS
> c41efbf2ad56 MAINTAINERS: ena: remove Zorik Machulsky from reviewers
> 5e62d124f75a MAINTAINERS: vrf: move Shrijeet to CREDITS
> 09cd3f4683a9 MAINTAINERS: net: move Alexey Kuznetsov to CREDITS
> 93089de91e85 MAINTAINERS: altx: move Jay Cliburn to CREDITS
> 8b0f64b113d6 MAINTAINERS: remove names from mailing list maintainers
> 
I'm assuming the purging is not totally automated, is it? As long as
the entries are informative to a human reader, it should be possible
to skip the relevant ones when purging inactive entries.

I believe this patch makes the situation better than it is currently
(at least for the human reader), by marking lists without public
read-access in a format that is more appropriate. In the future, we
could perhaps improve on it to ease automation too, but for now I
think it is worthwhile to merge this change (unless there are strong
objections or better alternatives that everyone agrees on).

Regards,
Srivatsa
