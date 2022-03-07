Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCC14D04EA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 18:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0A810E0A7;
	Mon,  7 Mar 2022 17:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu
 [128.30.2.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 59FD810E0A7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 17:06:57 +0000 (UTC)
Received: from [117.192.122.233] (helo=srivatsab-a02.vmware.com)
 by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
 (Exim 4.82) (envelope-from <srivatsa@csail.mit.edu>)
 id 1nRGog-000Ti1-FU; Mon, 07 Mar 2022 12:06:38 -0500
To: jgross@suse.com, x86@kernel.org, pv-drivers@vmware.com,
 tglx@linutronix.de, bp@alien8.de
References: <164574138686.654750.10250173565414769119.stgit@csail.mit.edu>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Subject: Re: [PATCH v5 0/3] Update VMware maintainer entries
Message-ID: <b0a49148-de03-a591-0849-6bb7d8e8b659@csail.mit.edu>
Date: Mon, 7 Mar 2022 22:36:23 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <164574138686.654750.10250173565414769119.stgit@csail.mit.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: keerthanak@vmware.com, Ronak Doshi <doshir@vmware.com>,
 Deep Shah <sdeep@vmware.com>, anishs@vmware.com, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 linux-scsi@vger.kernel.org, Vishal Bhakta <vbhakta@vmware.com>,
 Nadav Amit <namit@vmware.com>, srivatsab@vmware.com, kuba@kernel.org,
 Alexey Makhalov <amakhalov@vmware.com>, Joe Perches <joe@perches.com>,
 linux-graphics-maintainer@vmware.com, Vivek Thampi <vithampi@vmware.com>,
 rostedt@goodmis.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+virtualization list, which I forgot to CC when posting v5]

Hi Thomas, other x86 maintainers,

On 2/25/22 2:23 PM, Srivatsa S. Bhat wrote:
> This series updates a few maintainer entries for VMware-maintained
> subsystems and cleans up references to VMware's private mailing lists
> to make it clear that they are effectively email-aliases to reach out
> to reviewers.
> 

Since this patchset got ACKs from the relevant subsystem maintainers,
would you mind taking them through your tree, if this looks good to
you too?

Thank you!

Regards,
Srivatsa

> Changes from v4->v5:
> - Add Alexey as reviewer for paravirt ops.
> 
> Changes from v3->v4:
> - Remove Cc: stable@vger.kernel.org from patches 1 and 2.
> 
> Changes from v1->v3:
> - Add Zack as the named maintainer for vmmouse driver
> - Use R: to denote email-aliases for VMware reviewers
> 
> Regards,
> Srivatsa
> VMware Photon OS
> 
> ---
> 
> Srivatsa S. Bhat (VMware) (3):
>       MAINTAINERS: Update maintainers for paravirt ops and VMware hypervisor interface
>       MAINTAINERS: Add Zack as maintainer of vmmouse driver
>       MAINTAINERS: Mark VMware mailing list entries as email aliases
> 
> 
>  MAINTAINERS | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> 


