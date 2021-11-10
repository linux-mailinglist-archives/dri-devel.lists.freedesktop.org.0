Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EBC44CA00
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 21:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C366E824;
	Wed, 10 Nov 2021 20:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu
 [128.30.2.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E4BE6E85C
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 20:04:32 +0000 (UTC)
Received: from [128.177.79.46] (helo=[10.118.101.22])
 by outgoing-stata.csail.mit.edu with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.82)
 (envelope-from <srivatsa@csail.mit.edu>)
 id 1mktpe-000YUv-Gt; Wed, 10 Nov 2021 15:04:30 -0500
Subject: [PATCH v3 0/3] Update VMware maintainer entries
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: jgross@suse.com, x86@kernel.org, pv-drivers@vmware.com
Date: Wed, 10 Nov 2021 12:07:44 -0800
Message-ID: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Ronak Doshi <doshir@vmware.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, namit@vmware.com,
 amakhalov@vmware.com, srivatsa@csail.mit.edu, srivatsab@vmware.com,
 linux-scsi@vger.kernel.org, Vishal Bhakta <vbhakta@vmware.com>,
 sdeep@vmware.com, linux-graphics-maintainer@vmware.com,
 linux-input@vger.kernel.org, kuba@kernel.org, rostedt@goodmis.org,
 keerthanak@vmware.com, anishs@vmware.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-rdma@vger.kernel.org, joe@perches.com, vithampi@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series updates a few maintainer entries for VMware-maintained
subsystems and cleans up references to VMware's private mailing lists
to make it clear that they are effectively email-aliases to reach out
to reviewers.

Changes from v1->v3:
- Add Zack as the named maintainer for vmmouse driver
- Use R: to denote email-aliases for VMware reviewers

Regards,
Srivatsa

---

Srivatsa S. Bhat (VMware) (3):
      MAINTAINERS: Update maintainers for paravirt ops and VMware hypervisor interface
      MAINTAINERS: Add Zack as maintainer of vmmouse driver
      MAINTAINERS: Mark VMware mailing list entries as email aliases


 MAINTAINERS |   30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

