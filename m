Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB027DFDDE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 03:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050AD10E368;
	Fri,  3 Nov 2023 02:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Fri, 03 Nov 2023 02:09:14 UTC
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4B810E025;
 Fri,  3 Nov 2023 02:09:14 +0000 (UTC)
Message-ID: <a8b2653a-88de-456c-b8ae-2705fc35fcd9@dakr.org>
Date: Fri, 3 Nov 2023 03:03:38 +0100
MIME-Version: 1.0
Subject: Re: [Nouveau] nouveau/gsp: move to latest fw and small fixes
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231031051943.1957328-1-airlied@gmail.com>
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <20231031051943.1957328-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the series:

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

On 10/31/23 06:18, Dave Airlie wrote:
> This moves Ben's work to the latest GSP stable firmware 535.113.01.
> We will be stuck on this for a while.
> 
> There is also a fix for a message signature, and additions of two
> registry entries, which seem to help recover from crashes.
> 
> Dave.
> 
> 
