Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A2262BF3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 11:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95416EDAE;
	Wed,  9 Sep 2020 09:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6EA6EDAE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 09:35:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87B94ADBD;
 Wed,  9 Sep 2020 09:35:03 +0000 (UTC)
Subject: Re: [PATCH v5 6/7] arm: dts: mt7623: move display nodes to separate
 mt7623n.dtsi
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-7-linux@fw-web.de>
 <57085883-5044-aec2-021b-3b0880da70bc@gmail.com>
Message-ID: <3b3ef297-a3cf-6a3f-3118-9cc8b4ccc1f4@gmail.com>
Date: Wed, 9 Sep 2020 11:35:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <57085883-5044-aec2-021b-3b0880da70bc@gmail.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Woodhouse <dwmw@amazon.co.uk>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/09/2020 11:29, Matthias Brugger wrote:
> 
> 
> On 19/08/2020 10:17, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files.de>
>>
>> mt7623a has no graphics support so move nodes from generic mt7623.dtsi
>> to mt7623n.dtsi
>>
>> Fixes: 1f6ed224594 ("arm: dts: mt7623: add Mali-450 device node")
>> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> Applied to v5.9-next/dts32
> 

Realized that there is a v6, so I pull out this and 7/7.

Regards,
Matthias
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
