Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92445FD5F4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 10:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9BD10E056;
	Thu, 13 Oct 2022 08:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3FE10E056
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 08:10:29 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mp2Df0bwszpVlX;
 Thu, 13 Oct 2022 16:07:14 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 16:10:25 +0800
Message-ID: <b9cc8625-81d1-71c1-69c7-40e6b6c579dd@huawei.com>
Date: Thu, 13 Oct 2022 16:10:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/omapdrm: Remove unused struct csc_coef_rgb2yuv
To: Cai Huoqing <cai.huoqing@linux.dev>
References: <20220927133847.103410-1-yuancan@huawei.com>
 <20221013063932.GA10922@chq-T47>
From: Yuan Can <yuancan@huawei.com>
In-Reply-To: <20221013063932.GA10922@chq-T47>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
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
Cc: neil.armstrong@linaro.org, arnd@arndb.de, tomba@kernel.org,
 guozhengkui@vivo.com, airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

在 2022/10/13 14:39, Cai Huoqing 写道:
> On 27 9月 22 13:38:47, Yuan Can wrote:
>> After commit 64ff18911878("drm/omap: Enable COLOR_ENCODING and COLOR_RANGE
> Hi yuan,
>
> This is not a valid Fixes: tag.
>
> Add to your ~/.gitconfig and add:
>
> [pretty]
>          fixes = Fixes: %h (\"%s\")
>
> You can then do
>
> git log --pretty=fixes 64ff18911878
>
> and get:
>
> Fixes: 64ff18911878 ("drm/omap: Enable COLOR_ENCODING and COLOR_RANGE properties for planes")
>
> Which is the correct format. Don't wrap it, if it is long.

Ok, thanks for the advice! I will resend the patch with the valid Fixes: 
tag.

Best regards,

Yuan Can

