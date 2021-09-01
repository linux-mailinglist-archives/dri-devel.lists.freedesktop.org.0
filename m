Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42E13FDF46
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 18:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF196E043;
	Wed,  1 Sep 2021 16:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by gabe.freedesktop.org (Postfix) with ESMTP id 86B346E043
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 16:02:09 +0000 (UTC)
Received: from [172.18.79.212] (unknown [46.183.103.17])
 by mail.bugwerft.de (Postfix) with ESMTPSA id C653132D3FA;
 Wed,  1 Sep 2021 16:02:03 +0000 (UTC)
Subject: Re: [PATCH v9 0/2] gpu: drm: add driver for ili9361 panel
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20210901103040.1419706-1-daniel@zonque.org>
 <YS+MOZkE82ar827n@ravnborg.org>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <bf7df40f-0748-bad4-df51-75b2c39faccc@zonque.org>
Date: Wed, 1 Sep 2021 18:01:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YS+MOZkE82ar827n@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 9/1/21 4:20 PM, Sam Ravnborg wrote:
> Hi Daniel,
> 
> On Wed, Sep 01, 2021 at 12:30:38PM +0200, Daniel Mack wrote:
>> This is v9 of the series.
>>
>> Changelog:
>>
>> v2 -> v3:
>> 	* Turn Documentation into yaml format
> 
> ...
> 
>> Daniel Mack (2):
>>   dt-bindings: display: add bindings for newhaven,1.8-128160EF
>>   drm/tiny: add driver for newhaven,1.8-128160EF
>>
>>  .../bindings/display/ilitek,ili9163.txt       |  27 +++
> 
> Despite the changelog the patch contains a .txt file.
> Did you push the right patchset?

Meh, you're right. Something went wrong in the rebase.
Thanks for spotting this! Will send a v10 in a minute!


Daniel
