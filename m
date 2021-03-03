Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0A532B614
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 10:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BF189F53;
	Wed,  3 Mar 2021 09:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F344089F53
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 09:16:37 +0000 (UTC)
IronPort-SDR: 4cWDz9f5ZR+2PDEGd7/4oyoMIke5f3OiGcdMMU8nGrRjQ+C8iYPWlN9eJnBlSy4So5+pF1SFuA
 fDeY6n7fbmLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174271994"
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; d="scan'208";a="174271994"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 01:16:34 -0800
IronPort-SDR: MIXrUi1Pk1eBWsyCE7v4Wu45ivZM/hf78/2qZ1fXTOb+851uoLiz9CqA9y5wRvm5++RCZ2PVtD
 vAjkA78WgqMg==
X-IronPort-AV: E=Sophos;i="5.81,219,1610438400"; d="scan'208";a="407152056"
Received: from ameleshx-mobl1.ger.corp.intel.com (HELO [10.249.42.71])
 ([10.249.42.71])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 01:16:33 -0800
Subject: Re: [PATCH] drm: fix drm_mode_create_blob comment
To: Simon Ser <contact@emersion.fr>
References: <20210302184427.1301264-1-lionel.g.landwerlin@intel.com>
 <Nf4cFhlWS8f3tTL_MvE_MtW993Krf02M8R5WC-RyZ5fYosyKCej9FqPT8QgDwhCnacxn3nKd_HLWjgi47kOrQiYRXVO361sSskqgtp8FoDk=@emersion.fr>
 <845e5b3d-e0f8-5744-912f-451f68d75c70@intel.com>
 <Eiy9zIP90rvGFYbBWMLgx5IENCX1uayDndzSAWKt6h2qu_bIglC1qlK_8dtQ28TX2CwSpdZx8k3vKkHiRrPoY8iGjORz3C4Y3v2RMQYWoT8=@emersion.fr>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <6ec321e9-d6a0-52fc-7c29-6be3d8b829dc@intel.com>
Date: Wed, 3 Mar 2021 11:16:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <Eiy9zIP90rvGFYbBWMLgx5IENCX1uayDndzSAWKt6h2qu_bIglC1qlK_8dtQ28TX2CwSpdZx8k3vKkHiRrPoY8iGjORz3C4Y3v2RMQYWoT8=@emersion.fr>
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
Cc: Ben Widawsky <ben@bwidawsk.net>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/03/2021 20:48, Simon Ser wrote:
> On Tuesday, March 2nd, 2021 at 7:47 PM, Lionel Landwerlin <lionel.g.landwerlin@intel.com> wrote:
>
>> Thanks Simon. Do you have the rights to push this patch?
> Ah, since you're asking about this, it probably means you don't have the
> rights. I'll push the patch now to drm-misc-next.

Thanks a bunch!


-Lionel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
