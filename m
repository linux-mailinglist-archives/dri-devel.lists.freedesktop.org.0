Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7964F1A44A8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 11:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1287B6ECB8;
	Fri, 10 Apr 2020 09:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 675 seconds by postgrey-1.36 at gabe;
 Thu, 09 Apr 2020 07:18:35 UTC
Received: from mx.kolabnow.com (mx.kolabnow.com [95.128.36.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C966E6EB56
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 07:18:35 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 87520BB8;
 Thu,  9 Apr 2020 09:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received:received:received; s=dkim20160331; t=
 1586416036; x=1588230437; bh=CR6YNXrsOFFgGGN4E5h4mEiC7xqdpy0fPI3
 euxlrRik=; b=hV2TUNwJO5MJ2HIDsZTAGAoyMMYw1shO1io2Z+OaLWJR6uS6SFs
 ApD8Xh9Zj29Z6f8iFz249nu4R3j4EJBU6WmIamE5XQy5v+JPInUaCFd8siPb3zw3
 kBauPIUue9EMo2URDi9aLLnwEZgusLXdD1gfYc/F88sfyTAJlQrrJvxjEJagcIwt
 Y9w341+MLh+kvXPwHPvpF1ExHOgE8bzlIyRdvldMvFv27NOzBUgMtcvFVR3Om81d
 n61jSIVlzN2nZPU4F/xpn3PuZtecjssI0LCJindaFQGWpDGSlg97hVlCHK3o+2ZE
 KHqPzI+nr2TlELjcGi+0RfSQGbmRGLeg1Eupev0lQ84qGuq3KtMYntttI0Du3e1D
 WlaYC94qGE3hpzUemlqromTKDYPqIc0Q697HGosu0fjmt9qcEfNL2hBc9Wlri+Kh
 cU4vjgK0YVT4Dwvn0HHcuAPbhYGoB3dootjQ8ml5HAkv8kA9br+P4D5sLqvnujRY
 rkIs2H5vdnOMv0W08ffI/Gc/CMZlDetfY8s+K69Ry3udMsVIy/MjvwyVSY2stzN3
 wHDVlMD/qnjh+nLSzezaBv1gIvZnIFm7zEFyL05Gg1UxywFFyFqjPLf9ZETyRoKM
 wIvmk9yPvK3HBbdkza0j3ltoblnbkQtF/h0nsAgwHrv7BLnyKNEJyNy4=
X-Virus-Scanned: amavisd-new at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-10 required=5
 tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPRTEy1MsLlq; Thu,  9 Apr 2020 09:07:16 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
 by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id B59B83E1;
 Thu,  9 Apr 2020 09:07:16 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
 by int-mx001.mykolab.com (Postfix) with ESMTPS id 194D6526;
 Thu,  9 Apr 2020 09:07:15 +0200 (CEST)
From: Federico Vaga <federico.vaga@vaga.pv.it>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 03/35] docs: fix broken references to text files
Date: Thu, 09 Apr 2020 09:07:13 +0200
Message-ID: <2427906.fv9odQMh6t@harkonnen>
In-Reply-To: <2e12bf13355bd06748fed5d135fd4de3d94ad5fd.1586359676.git.mchehab+huawei@kernel.org>
References: <cover.1586359676.git.mchehab+huawei@kernel.org>
 <2e12bf13355bd06748fed5d135fd4de3d94ad5fd.1586359676.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Apr 2020 09:45:19 +0000
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
Cc: kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Akira Yokosawa <akiyks@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-unionfs@vger.kernel.org,
 Paul Mackerras <paulus@ozlabs.org>, linux-mm@kvack.org,
 Harry Wei <harryxiyou@gmail.com>, Alex Shi <alex.shi@linux.alibaba.com>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 linux-arch@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Doug Ledford <dledford@redhat.com>,
 Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel@lists.infradead.org,
 Jade Alglave <j.alglave@ucl.ac.uk>, Daniel Lustig <dlustig@nvidia.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Mike Leach <mike.leach@linaro.org>, Andrea Parri <parri.andrea@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Luc Maranget <luc.maranget@inria.fr>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 David Howells <dhowells@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Morse <james.morse@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Marc Zyngier <maz@kernel.org>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, April 8, 2020 5:45:55 PM CEST Mauro Carvalho Chehab wrote:
> Several references got broken due to txt to ReST conversion.
> 
> Several of them can be automatically fixed with:
> 
> 	scripts/documentation-file-ref-check --fix
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org> #
> hwtracing/coresight/Kconfig Signed-off-by: Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org>
> ---
>  Documentation/memory-barriers.txt                    |  2 +-
>  Documentation/process/submit-checklist.rst           |  2 +-
>  .../translations/it_IT/process/submit-checklist.rst  |  2 +-

Acked-by: Federico Vaga <federico.vaga@vaga.pv.it>



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
