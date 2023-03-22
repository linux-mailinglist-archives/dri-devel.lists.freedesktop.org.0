Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245F56C4668
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC6110E8DF;
	Wed, 22 Mar 2023 09:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BE710E8DF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:29:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 04803B81BE9;
 Wed, 22 Mar 2023 09:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64136C4339B;
 Wed, 22 Mar 2023 09:29:46 +0000 (UTC)
Message-ID: <eb09f4a7-f923-3f5f-ec95-0d07668ee275@xs4all.nl>
Date: Wed, 22 Mar 2023 10:29:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RESEND PATCH v4 00/21] Add Tegra20 parallel video input capture
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
 <20230322101417.4561a7ae@booty>
Content-Language: en-US
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230322101417.4561a7ae@booty>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/03/2023 10:14, Luca Ceresoli wrote:
> Hello,
> 
> On Thu,  9 Mar 2023 15:42:59 +0100
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> 
>> TL;DR: Resending this series with Rob's review tag added. Now all DT
>> patches have at least a reviewed-by tag from Rob or Krzysztof, all the
>> driver patches have one from Dmitry.
> 
> This is a gentle ping about this series. All patches have a
> reviewed-by, there are no major changes since v2, and it's touching a
> staging driver anyway.
> 
> I don't think there is more I can do at the moment besides pinging, but
> should there be anything, I'd be glad to know! :-)

I actually started on this last week, but now I am abroad again with no
hardware access.

I hope I can resume work on it next week, because after that I am again
abroad for 10 days or so.

It's currently very high on my todo list, so I really hope I will be able
to make progress on it next week.

Regards,

	Hans
