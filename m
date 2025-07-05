Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598A2AF9F0E
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jul 2025 10:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6FB10E376;
	Sat,  5 Jul 2025 08:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFDE10E369
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jul 2025 08:09:57 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id 8C8582C051D7;
 Sat,  5 Jul 2025 10:09:55 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 6749A41E00E; Sat,  5 Jul 2025 10:09:55 +0200 (CEST)
Date: Sat, 5 Jul 2025 10:09:55 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Yaron Avizrat <yaron.avizrat@intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Ofir Bitton <obitton@habana.ai>, linux-kernel@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jason Gunthorpe <jgg@nvidia.com>, Koby Elbaz <koby.elbaz@intel.com>,
 Konstantin Sinyuk <konstantin.sinyuk@intel.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Change habanalabs maintainer
Message-ID: <aGjd01Lyn5reVAEN@wunner.de>
References: <20240729121718.540489-1-obitton@habana.ai>
 <20240729121718.540489-2-obitton@habana.ai>
 <dc139f06-3f5a-4216-93c2-1e8b3b9c27ba@intel.com>
 <87cyevy9k0.fsf@intel.com>
 <f543ec81-1092-4700-b695-c4126f122444@intel.com>
 <Z8q6pCmCnVCCvBJK@GABBAY.>
 <be353276-3dce-49c1-8a35-164a33ddb9f9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be353276-3dce-49c1-8a35-164a33ddb9f9@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 11, 2025 at 10:25:05AM +0200, Avizrat, Yaron wrote:
> On 29/07/2024 15:17, Ofir Bitton wrote:
> > I will be leaving Intel soon, Yaron Avizrat will take the role
> > of habanalabs driver maintainer.
> >
> > Signed-off-by: Ofir Bitton <obitton@habana.ai>
>
> Reminder: can someone pick it up, please?

Applied to drm-misc-fixes with Yaron's, Jani's and Oded's acks.

Please submit a follow-up change to add Koby and Konstantin as
co-maintainers.

I'm picking this up despite Jani's request that you send a
pull request because retaining outdated MAINTAINERS entries
for a *year* is untenable.

Thanks,

Lukas
