Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40E8B28BB8
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 10:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471F110E089;
	Sat, 16 Aug 2025 08:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA43F10E089
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 08:11:07 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 258BE2005BAC;
 Sat, 16 Aug 2025 10:11:06 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 1527A2E6C8F; Sat, 16 Aug 2025 10:11:06 +0200 (CEST)
Date: Sat, 16 Aug 2025 10:11:06 +0200
From: Lukas Wunner <lukas@wunner.de>
To: "Avizrat, Yaron" <yaron.avizrat@intel.com>
Cc: linux-kernel@vger.kernel.org, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jason Gunthorpe <jgg@nvidia.com>, "Elbaz, Koby" <koby.elbaz@intel.com>,
 "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>,
 "Levi, Ilia" <ilia.levi@intel.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Change habanalabs maintainers
Message-ID: <aKA9GhFD29AJkuX0@wunner.de>
References: <20250814095556.5424-1-koby.elbaz@intel.com>
 <20250814095556.5424-2-koby.elbaz@intel.com>
 <DS0PR11MB77675D0ED3C78DF853B9A6CB8E35A@DS0PR11MB7767.namprd11.prod.outlook.com>
 <DM4PR11MB55491ACAA33DF29CEF3C67DAE935A@DM4PR11MB5549.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR11MB55491ACAA33DF29CEF3C67DAE935A@DM4PR11MB5549.namprd11.prod.outlook.com>
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

On Thu, Aug 14, 2025 at 10:44:07AM +0000, Avizrat, Yaron wrote:
> I will be leaving Intel soon, Koby Elbaz & Konstantin Sinyuk will take the role of habanalabs driver maintainers.
> 
> Signed-off-by: Yaron Avizrat <yaron.avizrat@intel.com>
> Reviewed-by: Koby Elbaz <koby.elbaz@intel.com>
> Reviewed-by: Konstantin Sinyuk <konstantin.sinyuk@intel.com>

Applied to drm-misc-fixes (with the commit message wrapped to 72 chars),
thanks!

Lukas
