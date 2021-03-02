Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B579A32A9A6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 19:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9315389C94;
	Tue,  2 Mar 2021 18:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF0989C94
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 18:47:19 +0000 (UTC)
IronPort-SDR: iLgRaEUlBLmt+cPQ0roYUQKOAR+/FyyJxpHwkLYhxnbfIIZ5jSmd2MJLkbKY0PLWj57GZ0hl+O
 ABHCrW+Kfawg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="248347236"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="248347236"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 10:47:18 -0800
IronPort-SDR: eJUhHo6RaDPwscXZXkemFEKB2by6NH91Uj1SvxJ01ZY4vDjJTSnsoFdVjbjRBJszFYk/Yx/fHl
 aeZDjiqCLrHw==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="406856258"
Received: from gbain-mobl.ger.corp.intel.com (HELO [10.252.45.167])
 ([10.252.45.167])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 10:47:17 -0800
Subject: Re: [PATCH] drm: fix drm_mode_create_blob comment
To: Simon Ser <contact@emersion.fr>
References: <20210302184427.1301264-1-lionel.g.landwerlin@intel.com>
 <Nf4cFhlWS8f3tTL_MvE_MtW993Krf02M8R5WC-RyZ5fYosyKCej9FqPT8QgDwhCnacxn3nKd_HLWjgi47kOrQiYRXVO361sSskqgtp8FoDk=@emersion.fr>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <845e5b3d-e0f8-5744-912f-451f68d75c70@intel.com>
Date: Tue, 2 Mar 2021 20:47:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <Nf4cFhlWS8f3tTL_MvE_MtW993Krf02M8R5WC-RyZ5fYosyKCej9FqPT8QgDwhCnacxn3nKd_HLWjgi47kOrQiYRXVO361sSskqgtp8FoDk=@emersion.fr>
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

Thanks Simon. Do you have the rights to push this patch?

-Lionel

On 02/03/2021 20:46, Simon Ser wrote:
> Good catch!
>
> Reviewed-by: Simon Ser <contact@emersion.fr>


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
