Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2EC7E8F97
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 12:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823F410E021;
	Sun, 12 Nov 2023 11:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CD710E021
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 11:23:16 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1r28Yb-0004SW-Jn; Sun, 12 Nov 2023 12:23:13 +0100
Message-ID: <a45a2e5a-505f-4438-84de-ef867934e655@leemhuis.info>
Date: Sun, 12 Nov 2023 12:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mainline build failure due to 7966f319c66d ("drm/amd/display:
 Introduce DML2")
Content-Language: en-US, de-DE
To: regressions@lists.linux.dev
References: <ZUNsmJGbYwgPaUpY@debian>
 <CADnq5_Minarw2D_TeRdkm6nJOP_4qHM+MxiMeLWMXqHxjq22Xw@mail.gmail.com>
 <CADVatmO9NCs=ryNg72HNzMDpqg862gpGnnFhQ4uwTpEkjOkCLw@mail.gmail.com>
 <CADnq5_Ou7Cq071DJZnq+3PDNqkd3ZJb+dCEvMjiked6_t=E6MA@mail.gmail.com>
 <CADVatmN4njCTGxNPjtpX9gdaySUxW07petaRP1uOzHaQNxf7fQ@mail.gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CADVatmN4njCTGxNPjtpX9gdaySUxW07petaRP1uOzHaQNxf7fQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1699788196;
 04bbf08b; 
X-HE-SMSGID: 1r28Yb-0004SW-Jn
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 04.11.23 10:42, Sudip Mukherjee wrote:
> On Thu, 2 Nov 2023 at 22:53, Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Thu, Nov 2, 2023 at 1:07 PM Sudip Mukherjee
>> <sudipm.mukherjee@gmail.com> wrote:
>>> On Thu, 2 Nov 2023 at 16:52, Alex Deucher <alexdeucher@gmail.com> wrote:
>>>> On Thu, Nov 2, 2023 at 5:32 AM Sudip Mukherjee (Codethink)
>>>> <sudipm.mukherjee@gmail.com> wrote:
>>
>> Should be fixed with Nathan's patch:
>> https://patchwork.freedesktop.org/patch/565675/
> 
> Yes, it does. Thanks.
> 
> Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

#regzbot fix: 6740ec97bcdbe9
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

