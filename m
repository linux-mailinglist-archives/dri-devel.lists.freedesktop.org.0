Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890074C392D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 23:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C2210E91A;
	Thu, 24 Feb 2022 22:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu
 [128.30.2.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id C280210E91A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 22:50:07 +0000 (UTC)
Received: from [128.177.79.46] (helo=[10.118.101.22])
 by outgoing-stata.csail.mit.edu with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.82)
 (envelope-from <srivatsa@csail.mit.edu>)
 id 1nNMSg-000HH6-Ik; Thu, 24 Feb 2022 17:19:46 -0500
Subject: [PATCH v5 0/3] Update VMware maintainer entries
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: jgross@suse.com, x86@kernel.org, pv-drivers@vmware.com,
 tglx@linutronix.de, bp@alien8.de
Date: Thu, 24 Feb 2022 14:23:48 -0800
Message-ID: <164574138686.654750.10250173565414769119.stgit@csail.mit.edu>
User-Agent: StGit/1.4
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
Cc: keerthanak@vmware.com, Ronak Doshi <doshir@vmware.com>, sdeep@vmware.com,
 anishs@vmware.com, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, srivatsa@csail.mit.edu,
 linux-scsi@vger.kernel.org, Vishal Bhakta <vbhakta@vmware.com>,
 namit@vmware.com, srivatsab@vmware.com, kuba@kernel.org, amakhalov@vmware.com,
 joe@perches.com, linux-graphics-maintainer@vmware.com, vithampi@vmware.com,
 rostedt@goodmis.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series updates a few maintainer entries for VMware-maintained
subsystems and cleans up references to VMware's private mailing lists
to make it clear that they are effectively email-aliases to reach out
to reviewers.

Changes from v4->v5:
- Add Alexey as reviewer for paravirt ops.

Changes from v3->v4:
- Remove Cc: stable@vger.kernel.org from patches 1 and 2.

Changes from v1->v3:
- Add Zack as the named maintainer for vmmouse driver
- Use R: to denote email-aliases for VMware reviewers

Regards,
Srivatsa
VMware Photon OS

---

Srivatsa S. Bhat (VMware) (3):
      MAINTAINERS: Update maintainers for paravirt ops and VMware hypervisor interface
      MAINTAINERS: Add Zack as maintainer of vmmouse driver
      MAINTAINERS: Mark VMware mailing list entries as email aliases


 MAINTAINERS | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

